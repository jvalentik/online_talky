import 'package:flutter/material.dart';
import 'package:online_talky/src/common/constants.dart';

class FatalError extends StatelessWidget {
  final String errorMessage;

  const FatalError({Key key, @required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fatal error'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Theme.of(context).brightness == Brightness.light
                  ? kSplashScreenLight
                  : kSplashScreenDark,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(errorMessage),
        ),
      ),
    );
  }
}
