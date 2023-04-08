import 'package:flutter/material.dart';



class ThemProvider with ChangeNotifier {
  static ThemeData themes = ThemeData.dark();
  ThemeData get theme => themes;
  final isDark = themes == ThemeData.dark();
  void toggleTheme() {
    if (isDark) {
      themes = ThemeData.light();
    } else {
      themes = ThemeData.dark();
    }
  }
}
