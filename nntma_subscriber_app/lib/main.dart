import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app_i18n.dart';
import 'core/app_language.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'features/pages/not_found_page.dart';
import 'features/shell/main_shell.dart';

void main() => runApp(const NgoApp());

class NgoApp extends StatelessWidget {
  const NgoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appLanguageController,
      builder: (context, _) {
        final shellRoutes = <String, WidgetBuilder>{
          for (final route in AppRoutes.shellRoutes)
            route: (_) => MainShell(initialRoute: route),
        };

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppI18n.current('app.name'),
          locale: appLanguageController.value.locale,
          supportedLocales: const [
            Locale('uz', 'Latn'),
            Locale('uz', 'Cyrl'),
            Locale('ru'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: buildAppTheme(),
          initialRoute: AppRoutes.home,
          routes: {
            AppRoutes.shell: (_) => const MainShell(initialRoute: AppRoutes.home),
            ...shellRoutes,
            AppRoutes.notFound: (_) => const NotFoundPage(),
            AppRoutes.cabinetShell: (_) => const MainShell(initialRoute: AppRoutes.cabinetDashboard),
          },
          onUnknownRoute: (_) => MaterialPageRoute(
            builder: (_) => const NotFoundPage(),
          ),
        );
      },
    );
  }
}
