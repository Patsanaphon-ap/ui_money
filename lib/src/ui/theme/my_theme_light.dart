import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: 'Roboto',
      primaryColor: Colors.blueAccent,
      primaryColorLight: Colors.blueGrey.shade50,
      primaryColorDark: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      indicatorColor: Colors.black12,
      dividerColor: Colors.grey,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.white),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
