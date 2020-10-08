import 'package:flutter/material.dart';

import 'package:farmasee/src/user_preferences/user_preference.dart';

class ThemeChanger with ChangeNotifier {

  ThemeChanger(this._themeData);
  
  ThemeData _themeData;
  final UserPreferences _prefs = UserPreferences();
  
  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData theme, bool flag) {
    _themeData = theme;
    _setPreferences(flag);
    notifyListeners();
  }
  void _setPreferences(bool flag){
    _prefs.theme = flag;
  }
}