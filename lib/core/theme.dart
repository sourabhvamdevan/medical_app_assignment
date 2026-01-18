
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.teal,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.orange,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    primary: Colors.teal,
    secondary: Colors.orange,
  ),
);
