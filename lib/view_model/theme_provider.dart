import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier
{
  static const themeStatus = 'THEME_STATUS';
    bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;
ThemeProvider(){
  getTheme();
}
  Future<void>setDarkTheme(bool value)async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
    _darkTheme = value;
    notifyListeners();
  }
  Future<bool>getTheme()async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.getBool(themeStatus);
    notifyListeners();
    return _darkTheme;
  }
}