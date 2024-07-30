import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xffeb3254),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xffeb3254),
    centerTitle: true,
  ),
  textTheme: TextTheme(
    titleLarge:
        GoogleFonts.spaceMono(fontSize: 45, fontWeight: FontWeight.w700),
    titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
  ),
);

var appDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: const Color(0xffeb3254),
  appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xffeb3254),
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white)),
  textTheme: const TextTheme(
    titleLarge: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
    titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
  ),
);
