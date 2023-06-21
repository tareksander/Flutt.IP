import 'package:flutt_ip/ui/login_page.dart';
import 'package:flutt_ip/ui/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/introduction", builder: (context, state) => const WelcomePage()),
  GoRoute(path: "/introduction2", builder: (context, state) => const WelcomePage2()),
  GoRoute(path: "/introduction3",builder: (context, state) => const WelcomePage3()),
  GoRoute(path: "/introduction4", builder: (context, state) => const WelcomePage4()),
  GoRoute(path: "/loginAuthSelect", builder: (context, state) => const LoginAuthSelectPage()),
]);


void main() async {
  //if (await firstAppStart()) {
    router.go("/introduction");
  //}
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutt.IP',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scrollbarTheme: const ScrollbarThemeData(thumbVisibility: MaterialStatePropertyAll(true))
      ),
      routerConfig: router,
    );
  }
}

