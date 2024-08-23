import 'package:flutter/material.dart';
import 'package:ui_money/src/environment.dart';
import 'package:ui_money/src/injector.dart';

import 'src/app.dart';

void main() async {
  await Environment.initialize();
  await initInstance();
  runApp(const MyApp());
}
