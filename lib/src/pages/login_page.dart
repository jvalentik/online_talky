import 'package:flutter/material.dart';
import 'package:online_talky/src/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Sign In'),
            onPressed: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
        ),
      ),
    );
  }
}
