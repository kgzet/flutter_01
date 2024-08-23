import 'package:flutter/material.dart';

import 'screens/home.dart';

// Dla takiego małego projektu możesz zrobić "generowanie" tej listy w MyAppState

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Article list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      // home: MyHomePage(title: 'List of articles'),
      // home: MainPage(),
      home: const HomePage(),
    );
  }
}
