import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../core/app_i18n.dart';
import '../../core/app_language.dart';
import '../../core/app_routes.dart';
import '../../core/app_tokens.dart';
import '../cabinet/pages/cabinet_applications_page.dart';
import '../cabinet/pages/cabinet_dashboard_page.dart';
import '../cabinet/pages/cabinet_documents_page.dart';
import '../cabinet/pages/cabinet_settings_page.dart';
import '../cabinet/pages/cabinet_support_page.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/news_page.dart';
import '../pages/services_page.dart';
import 'app_nav_item.dart';

class MainShell extends StatefulWidget {
  final String initialRoute;

  const MainShell({super.key, this.initialRoute = AppRoutes.home});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  static final pages = <AppNavItem>[
    AppNavItem(route: AppRoutes.home, title: 'Bosh sahifa', shortTitle: 'Bosh', icon: PhosphorIconsRegular.house, page: HomePage()),
    AppNavItem(route: AppRoutes.about, title: 'Biz haqimizda', shortTitle: 'About', icon: PhosphorIconsRegular.info, page: AboutPage()),
    AppNavItem(route: AppRoutes.news, title: 'Yangiliklar', shortTitle: 'Yangi', icon: PhosphorIconsRegular.newspaper, page: NewsPage()),
    AppNavItem(route: AppRoutes.services, title: 'Xizmatlar', shortTitle: 'Xizmat', icon: PhosphorIconsRegular.stack, page: ServicesPage()),
    AppNavItem(route: AppRoutes.contact, title: 'Boglanish', shortTitle: 'Aloqa', icon: PhosphorIconsRegular.phoneCall, page: ContactPage()),
    AppNavItem(route: AppRoutes.cabinetDashboard, title: 'Kabinet', shortTitle: 'CabDash', icon: PhosphorIconsRegular.squaresFour, page: CabinetDashboardPage()),
    AppNavItem(route: AppRoutes.cabinetApplications, title: 'Kabinet arizalar', shortTitle: 'CabApp', icon: PhosphorIconsRegular.clipboardText, page: CabinetApplicationsPage()),
    AppNavItem(route: AppRoutes.cabinetDocuments, title: 'Kabinet hujjatlar', shortTitle: 'CabDoc', icon: PhosphorIconsRegular.folder, page: CabinetDocumentsPage()),
    AppNavItem(route: AppRoutes.cabinetSupport, title: 'Kabinet yordam', shortTitle: 'CabHelp', icon: PhosphorIconsRegular.lifebuoy, page: CabinetSupportPage()),
    AppNavItem(route: AppRoutes.cabinetSettings, title: 'Kabinet sozlamalar', shortTitle: 'CabSet', icon: PhosphorIconsRegular.gear, page: CabinetSettingsPage()),
  ];

  late int _index;
  bool _menuOpen = false;

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
    if (route.startsWith('/cabinet')) {
      if (route == AppRoutes.cabinetDashboard) return 5;
      if (route == AppRoutes.cabinetApplications || route == AppRoutes.cabinetGrants) return 6;
      if (route == AppRoutes.cabinetDocuments) return 7;
      if (route == AppRoutes.cabinetSupport) return 8;
      return 9;
    }

    if ({
      AppRoutes.about,
      AppRoutes.whoWeAre,
      AppRoutes.mission,
      AppRoutes.boardOfExperts,
      AppRoutes.leadership,
      AppRoutes.ourTeam,
      AppRoutes.nntSchool,
      AppRoutes.onlineLibrary,
      AppRoutes.multimediaRoom,
      AppRoutes.structure,
      AppRoutes.sustainabilityIndex,
      AppRoutes.sustainabilityCert,
      AppRoutes.researchAreas,
    }.contains(route)) {
      return 1;
    }

    if ({
      AppRoutes.news,
      AppRoutes.newsDetail,
      AppRoutes.events,
      AppRoutes.eventDetail,
      AppRoutes.videos,
      AppRoutes.videoDetail,
      AppRoutes.publications,
      AppRoutes.publicationDetail,
      AppRoutes.searchResults,
    }.contains(route)) {
      return 2;
    }

    if ({
      AppRoutes.services,
      AppRoutes.projects,
      AppRoutes.awards,
      AppRoutes.officialDocs,
      AppRoutes.reportingForms,
      AppRoutes.faq,
      AppRoutes.membership,
      AppRoutes.membershipGuide,
      AppRoutes.membershipStatus,
      AppRoutes.membershipCertificate,
      AppRoutes.grants,
      AppRoutes.socialOrders,
      AppRoutes.serviceRequest,
      AppRoutes.serviceRequestStatus,
      AppRoutes.reportStatus,
    }.contains(route)) {
      return 3;
    }

    if (route == AppRoutes.contact) return 4;
    return 0;
  }

  void _selectIndex(int i) {
    setState(() {
      _menuOpen = false;
      if (i != _index) {
        _index = i;
      }
    });

    final target = pages[i].route;
    final current = ModalRoute.of(context)?.settings.name;
    if (current != target) {
      Navigator.of(context).pushReplacementNamed(target);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobileNav = MediaQuery.sizeOf(context).width <= 900;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const _BrandDot(),
            const SizedBox(width: AppSpace.sm),
            Text(context.i18n.t('app.name'), style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
        actions: mobileNav
            ? [
                _LanguageButton(menuTitle: context.i18n.t('lang.menu')),
                IconButton(
                  onPressed: () => setState(() => _menuOpen = !_menuOpen),
                  icon: PhosphorIcon(_menuOpen ? PhosphorIconsRegular.x : PhosphorIconsRegular.list),
                  tooltip: 'Menu',
                ),
              ]
            : [_LanguageButton(menuTitle: context.i18n.t('lang.menu'))],
        bottom: mobileNav
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 48,
                  padding: const EdgeInsets.only(left: AppSpace.sm, right: AppSpace.sm, bottom: AppSpace.xs),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: pages.length,
                    separatorBuilder: (_, index) => const SizedBox(width: AppSpace.xs),
                    itemBuilder: (context, i) {
                      final selected = i == _index;
                      final isCabinet = pages[i].route.startsWith('/cabinet');
                      return TextButton.icon(
                        onPressed: () => _selectIndex(i),
                        icon: PhosphorIcon(pages[i].icon, size: 16, color: selected ? Colors.white : AppTokens.textMuted),
                        label: Text(
                          _routeTitleShort(context, pages[i].route, isCabinet: isCabinet),
                          style: TextStyle(color: selected ? Colors.white : AppTokens.textMuted, fontWeight: selected ? FontWeight.w700 : FontWeight.w500),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpace.md),
                          backgroundColor: selected ? AppTokens.primary : Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
      body: Stack(
        children: [
          pages[_index].page,
          if (mobileNav)
            _MobileOverlayMenu(
              open: _menuOpen,
              items: pages,
              activeIndex: _index,
              onClose: () => setState(() => _menuOpen = false),
              onSelect: _selectIndex,
            ),
        ],
      ),
    );
  }
}

class _MobileOverlayMenu extends StatelessWidget {
  final bool open;
  final List<AppNavItem> items;
  final int activeIndex;
  final VoidCallback onClose;
  final ValueChanged<int> onSelect;

  const _MobileOverlayMenu({
    required this.open,
    required this.items,
    required this.activeIndex,
    required this.onClose,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final panelWidth = width.clamp(280.0, 390.0) * 0.9;

    final siteItems = <int>[];
    final cabinetItems = <int>[];
    for (var i = 0; i < items.length; i++) {
      if (items[i].route.startsWith('/cabinet')) {
        cabinetItems.add(i);
      } else {
        siteItems.add(i);
      }
    }

    return IgnorePointer(
      ignoring: !open,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: open ? 1 : 0,
            duration: const Duration(milliseconds: 180),
            child: GestureDetector(
              onTap: onClose,
              child: Container(color: const Color(0x66000000)),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            top: 0,
            bottom: 0,
            right: open ? 0 : -panelWidth - 24,
            child: Container(
              width: panelWidth,
              decoration: const BoxDecoration(
                color: AppTokens.bg,
                border: Border(left: BorderSide(color: AppTokens.border)),
                boxShadow: [BoxShadow(color: Color(0x22000000), blurRadius: 24, offset: Offset(-2, 0))],
              ),
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(AppSpace.lg, AppSpace.lg, AppSpace.lg, AppSpace.xl),
                  children: [
                    Builder(
                      builder: (context) => Text(
                        context.i18n.pick(
                          uzLatin: 'Navigatsiya',
                          uzCyrillic: 'Навигация',
                          russian: 'Навигация',
                          english: 'Navigation',
                        ),
                        style: const TextStyle(color: AppTokens.textMuted, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: AppSpace.md),
                    for (final i in siteItems)
                      _OverlayMenuTile(
                        item: items[i],
                        title: _routeTitle(context, items[i].route),
                        selected: i == activeIndex,
                        onTap: () => onSelect(i),
                      ),
                    const SizedBox(height: AppSpace.lg),
                    const Divider(height: 1, color: AppTokens.border),
                    const SizedBox(height: AppSpace.lg),
                    Builder(
                      builder: (context) => Text(
                        context.i18n.t('nav.cabinet'),
                        style: const TextStyle(color: AppTokens.textMuted, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: AppSpace.md),
                    for (final i in cabinetItems)
                      _OverlayMenuTile(
                        item: items[i],
                        title: _routeTitle(context, items[i].route),
                        selected: i == activeIndex,
                        onTap: () => onSelect(i),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverlayMenuTile extends StatelessWidget {
  final AppNavItem item;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _OverlayMenuTile({
    required this.item,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: selected ? AppTokens.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: selected ? AppTokens.primary : AppTokens.border),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: 18,
                color: selected ? Colors.white : AppTokens.primaryDark,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: selected ? Colors.white : AppTokens.text,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String menuTitle;
  const _LanguageButton({required this.menuTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => _showLanguageSheet(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: AppTokens.surface,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppTokens.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.language_rounded, size: 18, color: AppTokens.primaryDark),
                const SizedBox(width: 6),
                Text(
                  _shortLabel(appLanguageController.value),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppTokens.text),
                ),
                const SizedBox(width: 2),
                const Icon(Icons.expand_more_rounded, size: 16, color: AppTokens.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _shortLabel(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.uzLatin:
        return 'UZ';
      case AppLanguage.uzCyrillic:
        return 'UZ-CY';
      case AppLanguage.russian:
        return 'RU';
      case AppLanguage.english:
        return 'EN';
    }
  }

  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: AppTokens.bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuTitle,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTokens.text),
                ),
                const SizedBox(height: 12),
                for (final lang in AppLanguage.values)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _LangTile(
                      language: lang,
                      selected: appLanguageController.value == lang,
                      onTap: () {
                        appLanguageController.setLanguage(lang);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LangTile extends StatelessWidget {
  final AppLanguage language;
  final bool selected;
  final VoidCallback onTap;

  const _LangTile({
    required this.language,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: selected ? AppTokens.primary : AppTokens.border),
          color: selected ? const Color(0xFFEAF8FB) : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppTokens.primary : const Color(0xFFF2F5F6),
                shape: BoxShape.circle,
              ),
              child: Text(
                _chip(language),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: selected ? Colors.white : AppTokens.textMuted,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                language.label,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTokens.text),
              ),
            ),
            if (selected) const Icon(Icons.check_circle_rounded, size: 18, color: AppTokens.primary),
          ],
        ),
      ),
    );
  }

  String _chip(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.uzLatin:
        return 'UZ';
      case AppLanguage.uzCyrillic:
        return 'CY';
      case AppLanguage.russian:
        return 'RU';
      case AppLanguage.english:
        return 'EN';
    }
  }
}

class _BrandDot extends StatelessWidget {
  const _BrandDot();

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Text(
        'N',
        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, height: 1),
      ),
    );
  }
}

String _routeTitle(BuildContext context, String route) {
  final t = context.i18n.t;
  switch (route) {
    case AppRoutes.home:
      return t('nav.home');
    case AppRoutes.about:
      return t('nav.about');
    case AppRoutes.news:
      return t('nav.news');
    case AppRoutes.services:
      return t('nav.services');
    case AppRoutes.contact:
      return t('nav.contact');
    case AppRoutes.cabinetDashboard:
      return t('nav.cabinet');
    case AppRoutes.cabinetApplications:
      return t('nav.cabinet_app');
    case AppRoutes.cabinetDocuments:
      return t('nav.cabinet_docs');
    case AppRoutes.cabinetSupport:
      return t('nav.cabinet_support');
    case AppRoutes.cabinetSettings:
      return t('nav.cabinet_settings');
    default:
      return route;
  }
}

String _routeTitleShort(BuildContext context, String route, {required bool isCabinet}) {
  final full = _routeTitle(context, route);
  if (!isCabinet) return full;
  final cabinet = context.i18n.t('nav.cabinet');
  if (full == cabinet) return full;
  return '$cabinet - $full';
}

