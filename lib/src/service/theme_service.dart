import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  static bool isDarkMode() {
    bool isDarkMode = Get.isDarkMode;

    if (isDarkMode) {
      print("CURRENT THEME_MODE IS DARK");
    } else {
      print("CURRENT THEME_MODE IS LIGHT");
    }
    return isDarkMode;
  }

  static changeThemeMode() {
    // Get.changeTheme(isDarkMode() ? ThemeData.light() : ThemeData.dark());
    Get.changeThemeMode(isDarkMode() ? ThemeMode.light : ThemeMode.dark);
  }
}
