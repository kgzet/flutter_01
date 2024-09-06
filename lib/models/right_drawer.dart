import 'package:flutter/material.dart';
import 'dart:math';

import '../data/data.dart' as data;
import '../screens/home.dart';
import '../screens/about.dart';
import '../screens/article_view.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.aa,});

  final int aa;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text('Welcome!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('list of articles'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.sunny),
            title: const Text('random article'),
            onTap: () {
              var articleIndex = Random().nextInt(data.articlesList.length - 0);
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticlePage(pageIndex: articleIndex)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.heat_pump_rounded),
            title: const Text('about application'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
        ],
      )
    );
  }
}