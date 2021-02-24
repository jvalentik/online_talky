import 'package:flutter/material.dart';
import 'package:online_talky/src/pages/home_page.dart';
import 'package:online_talky/src/pages/login_page.dart';
import 'package:online_talky/src/pages/splash_page.dart';
import 'package:online_talky/src/widgets/fatal_error.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return _getPageRoute(settings: settings, viewToShow: LoginPage(), fullScreen: true);
        break;
      case HomePage.routeName:
        return _getPageRoute(settings: settings, viewToShow: HomePage());
        break;
      case SplashPage.routeName:
        return _getPageRoute(settings: settings, viewToShow: SplashPage(), fullScreen: true);
        break;
      default:
        return MaterialPageRoute(builder: (context) {
          return FatalError(errorMessage: settings.name);
        });
    }
  }

  static PageRoute _getPageRoute({RouteSettings settings, Widget viewToShow, fullScreen = false}) {
    return MaterialPageRoute<dynamic>(
        settings: settings, builder: (_) => viewToShow, fullscreenDialog: fullScreen);
  }
}
