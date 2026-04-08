import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../core/app_breakpoints.dart';
import '../../core/app_i18n.dart';
import '../../core/app_language.dart';
import '../../core/app_routes.dart';
import '../../core/app_tokens.dart';
import '../shell/app_nav_item.dart';
import 'pages/cabinet_applications_page.dart';
import 'pages/cabinet_dashboard_page.dart';
import 'pages/cabinet_documents_page.dart';
import 'pages/cabinet_grants_page.dart';
import 'pages/cabinet_settings_page.dart';
import 'pages/cabinet_support_page.dart';

class CabinetShell extends StatefulWidget {
  final String initialRoute;
  const CabinetShell({super.key, this.initialRoute = AppRoutes.cabinetDashboard});

  @override
  State<CabinetShell> createState() => _CabinetShellState();
}

class _CabinetShellState extends State<CabinetShell> {
  static const pages = <AppNavItem>[
    AppNavItem(
      route: AppRoutes.cabinetDashboard,
      title: 'Dashboard',
      shortTitle: 'Dash',
      icon: PhosphorIconsRegular.squaresFour,
      page: CabinetDashboardPage(),
    ),
    AppNavItem(
      route: AppRoutes.cabinetApplications,
      title: 'Arizalar',
      shortTitle: 'Ariza',
      icon: PhosphorIconsRegular.clipboardText,
      page: CabinetApplicationsPage(),
    ),
    AppNavItem(
      route: AppRoutes.cabinetDocuments,
      title: 'Hujjatlar',
      shortTitle: 'Docs',
      icon: PhosphorIconsRegular.folder,
      page: CabinetDocumentsPage(),
    ),
    AppNavItem(
      route: AppRoutes.cabinetGrants,
      title: 'Grantlar',
      shortTitle: 'Grant',
      icon: PhosphorIconsRegular.medal,
      page: CabinetGrantsPage(),
    ),
    AppNavItem(
      route: AppRoutes.cabinetSupport,
      title: 'Murojaat',
      shortTitle: 'Help',
      icon: PhosphorIconsRegular.headset,
      page: CabinetSupportPage(),
    ),
    AppNavItem(
      route: AppRoutes.cabinetSettings,
      title: 'Sozlamalar',
      shortTitle: 'Set',
      icon: PhosphorIconsRegular.gear,
      page: CabinetSettingsPage(),
    ),
  ];

  List<String> _navTitles(BuildContext context) {
    final i = context.i18n;
    return [
      'Dashboard',
      i.pick(uzLatin: 'Arizalar', uzCyrillic: 'Аризалар', russian: 'Заявки', english: 'Applications'),
      i.pick(uzLatin: 'Hujjatlar', uzCyrillic: 'Ҳужжатлар', russian: 'Документы', english: 'Documents'),
      i.pick(uzLatin: 'Grantlar', uzCyrillic: 'Грантлар', russian: 'Гранты', english: 'Grants'),
      i.pick(uzLatin: 'Murojaat', uzCyrillic: 'Мурожаат', russian: 'Обращения', english: 'Requests'),
      i.pick(uzLatin: 'Sozlamalar', uzCyrillic: 'Созламалар', russian: 'Настройки', english: 'Settings'),
    ];
  }

  List<String> _navShortTitles(BuildContext context) {
    final i = context.i18n;
    return [
      'Dash',
      i.pick(uzLatin: 'Ariza', uzCyrillic: 'Ариза', russian: 'Заявки', english: 'Apps'),
      i.pick(uzLatin: 'Docs', uzCyrillic: 'Docs', russian: 'Docs', english: 'Docs'),
      i.pick(uzLatin: 'Grant', uzCyrillic: 'Грант', russian: 'Гранты', english: 'Grants'),
      i.pick(uzLatin: 'Yordam', uzCyrillic: 'Ёрдам', russian: 'Помощь', english: 'Help'),
      i.pick(uzLatin: 'Set', uzCyrillic: 'Set', russian: 'Set', english: 'Set'),
    ];
  }

  late int _index;

  @override
  void initState() {
    super.initState();
    _index = _routeToIndex(widget.initialRoute);
    appLanguageController.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    appLanguageController.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged() => setState(() {});

  int _routeToIndex(String route) {
    final idx = pages.indexWhere((p) => p.route == route);
    return idx == -1 ? 0 : idx;
  }

  void _selectIndex(int i) {
    if (i == _index) return;
    setState(() => _index = i);

    final target = pages[i].route;
    final current = ModalRoute.of(context)?.settings.name;
    if (current != target) {
      Navigator.of(context).pushReplacementNamed(target);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bp = breakpointOf(MediaQuery.sizeOf(context).width);
    final phone = bp == AppBreakpoint.phone;
    final desktop = bp == AppBreakpoint.desktop;
    final titles = _navTitles(context);
    final shortTitles = _navShortTitles(context);
    final i18n = context.i18n;

    return Scaffold(
      appBar: _CabinetTopBar(
        onGoToSite: () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
      ),
      drawer: phone
          ? Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppTokens.navy,
                      padding: const EdgeInsets.fromLTRB(AppSpace.lg, AppSpace.md, AppSpace.lg, AppSpace.md),
                      child: Row(
                        children: [
                          const PhosphorIcon(PhosphorIconsRegular.squaresFour, color: AppTokens.primary, size: 18),
                          const SizedBox(width: AppSpace.sm),
                          Text(
                            i18n.pick(uzLatin: "A'zo Kabinet", uzCyrillic: 'Аъзо Кабинет', russian: 'Личный кабинет', english: 'Member Cabinet'),
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(top: AppSpace.sm),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(AppSpace.lg, AppSpace.sm, AppSpace.lg, AppSpace.xs),
                            child: Text(
                              i18n.pick(uzLatin: 'MENYU', uzCyrillic: 'МЕНЮ', russian: 'МЕНЮ', english: 'MENU'),
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppTokens.textMuted,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                          for (var i = 0; i < pages.length; i++)
                            ListTile(
                              dense: true,
                              selected: i == _index,
                              selectedTileColor: const Color(0xFFE0F7FC),
                              selectedColor: AppTokens.primaryDark,
                              leading: PhosphorIcon(pages[i].icon, size: 18),
                              title: Text(
                                titles[i],
                                style: TextStyle(
                                  fontWeight: i == _index ? FontWeight.w700 : FontWeight.w500,
                                ),
                              ),
                              onTap: () {
                                _selectIndex(i);
                                Navigator.pop(context);
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: phone
          ? pages[_index].page
          : Row(
              children: [
                NavigationRail(
                  backgroundColor: AppTokens.navy,
                  selectedIndex: _index,
                  extended: desktop,
                  minExtendedWidth: 220,
                  onDestinationSelected: _selectIndex,
                  labelType: desktop ? null : NavigationRailLabelType.selected,
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  unselectedIconTheme: const IconThemeData(color: Color(0xFF7CA1B5)),
                  selectedLabelTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13),
                  unselectedLabelTextStyle: const TextStyle(color: Color(0xFF7CA1B5), fontSize: 13),
                  indicatorColor: const Color(0x4000B4D8),
                  destinations: [
                    for (var i = 0; i < pages.length; i++)
                      NavigationRailDestination(
                        icon: PhosphorIcon(pages[i].icon),
                        label: Text(titles[i]),
                      ),
                  ],
                ),
                const VerticalDivider(width: 1, color: Color(0xFF1A3045)),
                Expanded(child: pages[_index].page),
              ],
            ),
      bottomNavigationBar: phone
          ? NavigationBar(
              selectedIndex: _index,
              onDestinationSelected: _selectIndex,
              destinations: [
                for (var i = 0; i < pages.length; i++)
                  NavigationDestination(
                    icon: PhosphorIcon(pages[i].icon),
                    label: shortTitles[i],
                  ),
              ],
            )
          : null,
    );
  }
}

class _CabinetTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onGoToSite;
  const _CabinetTopBar({required this.onGoToSite});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56 + MediaQuery.paddingOf(context).top,
      decoration: const BoxDecoration(
        color: AppTokens.navy,
        border: Border(bottom: BorderSide(color: Color(0xFF1A3045))),
      ),
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: Row(
        children: [
          const SizedBox(width: AppSpace.lg),
          // Brand
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTokens.primary, AppTokens.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text('N', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, height: 1)),
          ),
          const SizedBox(width: AppSpace.sm),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.i18n.pick(uzLatin: "A'zo Kabinet", uzCyrillic: 'Аъзо Кабинет', russian: 'Личный кабинет', english: 'Member Cabinet'),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14, height: 1.1),
              ),
              const Text('nntma.uz', style: TextStyle(color: Color(0xFF4A7A90), fontSize: 11, height: 1.1)),
            ],
          ),
          const Spacer(),
          // Notification bell
          _NotifButton(),
          const SizedBox(width: AppSpace.xs),
          // User avatar
          const _UserAvatar(initials: 'SK', name: 'Sanjar Kamolov'),
          const SizedBox(width: AppSpace.md),
          // Divider
          Container(width: 1, height: 24, color: const Color(0xFF1A3045)),
          const SizedBox(width: AppSpace.md),
          // Back to site
          GestureDetector(
            onTap: onGoToSite,
            child: Row(
              children: [
                const PhosphorIcon(PhosphorIconsRegular.arrowLeft, size: 14, color: Color(0xFF4A7A90)),
                const SizedBox(width: 4),
                Text(
                  context.i18n.pick(uzLatin: 'Saytga', uzCyrillic: 'Сайтга', russian: 'На сайт', english: 'To site'),
                  style: const TextStyle(color: Color(0xFF4A7A90), fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpace.lg),
        ],
      ),
    );
  }
}

class _NotifButton extends StatefulWidget {
  const _NotifButton();

  @override
  State<_NotifButton> createState() => _NotifButtonState();
}

class _NotifButtonState extends State<_NotifButton> {
  final _key = GlobalKey();
  bool _open = false;

  List<(String, String)> _getNotifs(BuildContext context) {
    final i = context.i18n;
    return [
      (
        i.pick(uzLatin: "Hujjat tekshiruvdan o'tdi", uzCyrillic: 'Ҳужжат текшириудан ўтди', russian: 'Документ прошёл проверку', english: 'Document passed review'),
        i.pick(uzLatin: '2 daqiqa oldin', uzCyrillic: '2 дақиқа олдин', russian: '2 минуты назад', english: '2 minutes ago'),
      ),
      (
        i.pick(uzLatin: 'Yangi ariza holati', uzCyrillic: 'Янги ариза ҳолати', russian: 'Новый статус заявки', english: 'New application status'),
        i.pick(uzLatin: '1 soat oldin', uzCyrillic: '1 соат олдин', russian: '1 час назад', english: '1 hour ago'),
      ),
      (
        i.pick(uzLatin: 'Muddat eslatmasi: 10.04.2026', uzCyrillic: 'Муддат эслатмаси: 10.04.2026', russian: 'Напоминание о сроке: 10.04.2026', english: 'Deadline reminder: 10.04.2026'),
        i.pick(uzLatin: 'Bugun', uzCyrillic: 'Бугун', russian: 'Сегодня', english: 'Today'),
      ),
    ];
  }

  void _toggle() {
    if (_open) {
      setState(() => _open = false);
      return;
    }
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    final offset = box.localToGlobal(Offset.zero);
    setState(() => _open = true);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 160),
      transitionBuilder: (ctx, a1, a2, child) => FadeTransition(
        opacity: CurvedAnimation(parent: a1, curve: Curves.easeOut),
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -0.04), end: Offset.zero).animate(CurvedAnimation(parent: a1, curve: Curves.easeOut)),
          child: child,
        ),
      ),
      pageBuilder: (ctx, a, b) {
        final notifs = _getNotifs(ctx);
        final i18n = ctx.i18n;
        return Stack(
          children: [
            Positioned(
              top: offset.dy + box.size.height + 6,
              right: MediaQuery.sizeOf(ctx).width - offset.dx - box.size.width,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTokens.radiusMd),
                elevation: 0,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppTokens.radiusMd),
                    border: Border.all(color: AppTokens.border),
                    boxShadow: AppTokens.cardShadows,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(AppSpace.lg, AppSpace.md, AppSpace.lg, AppSpace.sm),
                        child: Row(
                          children: [
                            Text(
                              i18n.pick(uzLatin: 'Bildirishnomalar', uzCyrillic: 'Билдиришномалар', russian: 'Уведомления', english: 'Notifications'),
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(color: AppTokens.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(999)),
                              child: Text(
                                i18n.pick(uzLatin: '3 yangi', uzCyrillic: '3 янги', russian: '3 новых', english: '3 new'),
                                style: const TextStyle(fontSize: 11, color: AppTokens.primaryDark, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      for (var j = 0; j < notifs.length; j++) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpace.lg, vertical: AppSpace.md),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 7,
                                height: 7,
                                margin: const EdgeInsets.only(top: 5),
                                decoration: const BoxDecoration(color: AppTokens.primary, shape: BoxShape.circle),
                              ),
                              const SizedBox(width: AppSpace.sm),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(notifs[j].$1, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.3)),
                                    const SizedBox(height: 2),
                                    Text(notifs[j].$2, style: const TextStyle(fontSize: 11, color: AppTokens.textMuted)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (j < notifs.length - 1) const Divider(height: 1, indent: AppSpace.lg + AppSpace.sm + 7),
                      ],
                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSpace.sm),
                        child: Center(
                          child: TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: Text(
                              i18n.pick(uzLatin: "Barchasini ko'rish", uzCyrillic: 'Барчасини кўриш', russian: 'Смотреть все', english: 'View all'),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ).then((_) => setState(() => _open = false));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: _toggle,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: _open ? const Color(0xFF0E2035) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const PhosphorIcon(PhosphorIconsRegular.bell, size: 18, color: Color(0xFF8AAFC4)),
            Positioned(
              top: -3,
              right: -3,
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(color: AppTokens.primary, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800, height: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String initials;
  final String name;
  const _UserAvatar({required this.initials, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0EA5C9), AppTokens.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF1A3045), width: 2),
          ),
          alignment: Alignment.center,
          child: Text(initials, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800, height: 1)),
        ),
        const SizedBox(width: AppSpace.sm),
        Text(name, style: const TextStyle(color: Color(0xFF8AAFC4), fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
