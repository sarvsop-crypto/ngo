import 'package:flutter/material.dart';

void main() {
  runApp(const NntmaSubscriberApp());
}

class NntmaSubscriberApp extends StatelessWidget {
  const NntmaSubscriberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NNTMa Subscriber',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006A5B)),
        scaffoldBackgroundColor: const Color(0xFFF5F7F7),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  SubscriberProfile? _profile;

  void _onSignedIn(SubscriberProfile profile) {
    setState(() {
      _profile = profile;
    });
  }

  void _onSignedOut() {
    setState(() {
      _profile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_profile == null) {
      return SignInScreen(onSignedIn: _onSignedIn);
    }
    return SubscriberHomeScreen(
      profile: _profile!,
      onSignOut: _onSignedOut,
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.onSignedIn});

  final ValueChanged<SubscriberProfile> onSignedIn;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _memberIdController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _memberIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    final profile = await SubscriberAuthService.verifySubscriber(
      memberId: _memberIdController.text.trim(),
      password: _passwordController.text,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _isSubmitting = false;
    });

    if (profile == null) {
      setState(() {
        _errorMessage =
            'No active NNTMa subscription found. Use your approved member ID.';
      });
      return;
    }

    widget.onSignedIn(profile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'NNTMa Subscribers',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sign in with your approved NGO membership account.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _memberIdController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Member ID',
                            hintText: 'Example: NNT-1042',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            final text = (value ?? '').trim();
                            if (text.isEmpty) {
                              return 'Enter member ID';
                            }
                            if (!text.startsWith('NNT-')) {
                              return 'Member ID must start with NNT-';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if ((value ?? '').length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        FilledButton(
                          onPressed: _isSubmitting ? null : _submit,
                          child: _isSubmitting
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Text('Sign in'),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Temporary validation: member IDs starting with NNT- are accepted.\n'
                          'Connect this screen to ngo.uz API for production.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubscriberHomeScreen extends StatefulWidget {
  const SubscriberHomeScreen({
    super.key,
    required this.profile,
    required this.onSignOut,
  });

  final SubscriberProfile profile;
  final VoidCallback onSignOut;

  @override
  State<SubscriberHomeScreen> createState() => _SubscriberHomeScreenState();
}

class _SubscriberHomeScreenState extends State<SubscriberHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _OverviewPage(profile: widget.profile),
      const _ServicesPage(),
      _ProfilePage(
        profile: widget.profile,
        onSignOut: widget.onSignOut,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('NNTMa Member App'),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Overview',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: 'Services',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _OverviewPage extends StatelessWidget {
  const _OverviewPage({required this.profile});

  final SubscriberProfile profile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(profile.name.substring(0, 1)),
            ),
            title: Text(profile.name),
            subtitle: Text('Member ID: ${profile.memberId}'),
            trailing: const Chip(
              label: Text('Active'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Card(
          child: ListTile(
            leading: Icon(Icons.event_available),
            title: Text('Upcoming Event'),
            subtitle: Text('Knowledge Exchange Forum - April 14, 2026'),
          ),
        ),
        const SizedBox(height: 10),
        const Card(
          child: ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            title: Text('Action Required'),
            subtitle: Text('Submit your quarterly activity report by April 20.'),
          ),
        ),
      ],
    );
  }
}

class _ServicesPage extends StatelessWidget {
  const _ServicesPage();

  @override
  Widget build(BuildContext context) {
    final services = [
      ('Membership Certificate', Icons.verified_user_outlined),
      ('Membership Status', Icons.badge_outlined),
      ('Reporting Forms', Icons.assignment_outlined),
      ('Official Documents', Icons.gavel_outlined),
      ('Events and Training', Icons.school_outlined),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: services.length,
      separatorBuilder: (_, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final (title, icon) = services[index];
        return Card(
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
            subtitle: const Text('Connect to ngo.uz endpoint'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title integration is pending')),
              );
            },
          ),
        );
      },
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage({required this.profile, required this.onSignOut});

  final SubscriberProfile profile;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text('Organization: ${profile.organization}'),
                Text('Member ID: ${profile.memberId}'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: onSignOut,
          icon: const Icon(Icons.logout),
          label: const Text('Sign out'),
        ),
      ],
    );
  }
}

class SubscriberProfile {
  const SubscriberProfile({
    required this.memberId,
    required this.name,
    required this.organization,
  });

  final String memberId;
  final String name;
  final String organization;
}

class SubscriberAuthService {
  static Future<SubscriberProfile?> verifySubscriber({
    required String memberId,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 900));

    if (!memberId.startsWith('NNT-') || password.length < 6) {
      return null;
    }

    return SubscriberProfile(
      memberId: memberId,
      name: 'NNTMa Subscriber',
      organization: 'ngo.uz',
    );
  }
}
