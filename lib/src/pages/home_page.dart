import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: Text('This is HomePage'),
        ),
      ),
    );
  }
}
