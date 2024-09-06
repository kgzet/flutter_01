import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorSchemeSeed: Colors.amber,
  // scaffoldBackgroundColor: Theme.of(context).colorScheme.surface,
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.pink,
);
