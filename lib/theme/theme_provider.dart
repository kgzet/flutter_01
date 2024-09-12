import 'package:flutter/material.dart';

import '../data/data.dart';
import 'theme.dart';


class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
      iconMode = Icons.light_mode_outlined;
    }
    else{
      themeData = lightMode;
      iconMode = Icons.mode_night_outlined;
    }
  }
}