import 'package:flutter/material.dart';

class theme_manager extends ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.light;

  get thememode => _themeMode;

  ToggleTheme(bool isDark ){
    _themeMode = isDark?ThemeMode.dark:ThemeMode.light;
}
}