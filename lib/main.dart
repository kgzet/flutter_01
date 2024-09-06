import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home.dart';
import 'theme/theme.dart';
// import 'screens/home_list.dart';
// import 'screens/home_grid_resp.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
      // return MaterialApp(
        title: 'Article list',
        theme: lightMode,
        home: const HomePage(),
      ),
    );
  }
}
