import 'dart:async';

import 'package:flutter/foundation.dart';

Future<void> simulateLoginCheck(VoidCallback action) async {
  var duration = new Duration(seconds: 5);
  return Timer(duration, action);
}
