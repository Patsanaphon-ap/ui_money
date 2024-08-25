import 'package:flutter/material.dart';
import 'package:ui_money/mock/mockinjector.dart';
import 'package:ui_money/src/environment.dart';

import 'src/app.dart';

void main() async {
  await Environment.initialize();
  await mockinitInstance();
  runApp(const MyApp());
}
