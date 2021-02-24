import 'package:flutter/material.dart';
import 'package:online_talky/src/common/constants.dart';
import 'package:online_talky/src/common/utils.dart';
import 'package:online_talky/src/pages/login_page.dart';
import 'package:online_talky/src/widgets/loader.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';
  const SplashPage();

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String splashImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Theme.of(context).brightness == Brightness.light
                  ? kSplashScreenLight
                  : kSplashScreenDark,
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: const Loader(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    simulateLoginCheck(_navigateToLogin);
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
  }
}
