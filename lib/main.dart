import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'screens/about.dart';
import 'screens/home.dart';
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
      // return MaterialApp(
        title: 'Article list',
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/about': (context) => const AboutPage(),
        },
        // themeMode: ThemeMode.system,
        // home: const HomePage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
        // darkTheme: ThemeData(),
      ),
    );
  }
}
