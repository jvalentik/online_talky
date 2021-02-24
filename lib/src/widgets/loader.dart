import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Loader extends StatelessWidget {
  @literal
  const Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
