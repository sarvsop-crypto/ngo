import 'package:flutter/material.dart';

import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'features/shell/main_shell.dart';

void main() => runApp(const NgoApp());

class NgoApp extends StatelessWidget {
  const NgoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ngo.uz',
      theme: buildAppTheme(),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.shell: (_) => const MainShell(initialRoute: AppRoutes.home),
        AppRoutes.home: (_) => const MainShell(initialRoute: AppRoutes.home),
        AppRoutes.about: (_) => const MainShell(initialRoute: AppRoutes.about),
        AppRoutes.news: (_) => const MainShell(initialRoute: AppRoutes.news),
        AppRoutes.events: (_) => const MainShell(initialRoute: AppRoutes.events),
        AppRoutes.services: (_) => const MainShell(initialRoute: AppRoutes.services),
        AppRoutes.contact: (_) => const MainShell(initialRoute: AppRoutes.contact),
        AppRoutes.cabinetShell: (_) => const MainShell(initialRoute: AppRoutes.cabinetDashboard),
        AppRoutes.cabinetDashboard: (_) => const MainShell(initialRoute: AppRoutes.cabinetDashboard),
        AppRoutes.cabinetApplications: (_) => const MainShell(initialRoute: AppRoutes.cabinetApplications),
        AppRoutes.cabinetDocuments: (_) => const MainShell(initialRoute: AppRoutes.cabinetDocuments),
        AppRoutes.cabinetGrants: (_) => const MainShell(initialRoute: AppRoutes.cabinetGrants),
        AppRoutes.cabinetSupport: (_) => const MainShell(initialRoute: AppRoutes.cabinetSupport),
        AppRoutes.cabinetSettings: (_) => const MainShell(initialRoute: AppRoutes.cabinetSettings),
        AppRoutes.cabinetOrganization: (_) => const MainShell(initialRoute: AppRoutes.cabinetOrganization),
        AppRoutes.cabinetReports: (_) => const MainShell(initialRoute: AppRoutes.cabinetReports),
        AppRoutes.cabinetEvents: (_) => const MainShell(initialRoute: AppRoutes.cabinetEvents),
        AppRoutes.cabinetNotifications: (_) => const MainShell(initialRoute: AppRoutes.cabinetNotifications),
        AppRoutes.cabinetApprovals: (_) => const MainShell(initialRoute: AppRoutes.cabinetApprovals),
        AppRoutes.cabinetStatistics: (_) => const MainShell(initialRoute: AppRoutes.cabinetStatistics),
        AppRoutes.cabinetSubscription: (_) => const MainShell(initialRoute: AppRoutes.cabinetSubscription),
        AppRoutes.cabinetApi: (_) => const MainShell(initialRoute: AppRoutes.cabinetApi),
        AppRoutes.cabinetAudit: (_) => const MainShell(initialRoute: AppRoutes.cabinetAudit),
        AppRoutes.cabinetEsignature: (_) => const MainShell(initialRoute: AppRoutes.cabinetEsignature),
        AppRoutes.cabinetFeedback: (_) => const MainShell(initialRoute: AppRoutes.cabinetFeedback),
        AppRoutes.cabinetKnowledge: (_) => const MainShell(initialRoute: AppRoutes.cabinetKnowledge),
        AppRoutes.cabinetNntData: (_) => const MainShell(initialRoute: AppRoutes.cabinetNntData),
        AppRoutes.cabinetNews: (_) => const MainShell(initialRoute: AppRoutes.cabinetNews),
      },
      onUnknownRoute: (_) => MaterialPageRoute(
        builder: (_) => const MainShell(initialRoute: AppRoutes.home),
      ),
    );
  }
}
