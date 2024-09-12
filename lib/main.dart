import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'data/data.dart';
import 'screens/home.dart';
// import 'theme/theme.dart';
import 'theme/theme_provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        navigatorKey: NavigationService.myNavigatorKey,
      // return MaterialApp(
        title: 'Article list',
        // themeMode: ThemeMode.system,
        home: const HomePage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
      ),
    );
  }
}
