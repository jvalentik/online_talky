import 'package:flutter/material.dart';
import 'package:online_talky/src/common/app_theme.dart';
import 'package:online_talky/src/common/routes.dart';
import 'package:online_talky/src/pages/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Talky',
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeProvider.getLightTheme(context),
      darkTheme: ThemeProvider.getDarkTheme(context),
      themeMode: ThemeMode.system,
      home: SplashPage(),
    );
  }
}
