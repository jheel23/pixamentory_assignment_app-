import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static AppTheme instance = AppTheme._();
  ThemeData apptheme = ThemeData(
    fontFamily: 'PressStart2P',
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff8A2BE2))
        .copyWith(
            brightness: Brightness.dark,
            primary: const Color(0xff8A2BE2),
            secondary: const Color(0xffFFD700)),
    useMaterial3: true,
  );
}
