import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/article_view.dart';


class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

@override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 42,
      color: theme.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text("List of articles"),
          centerTitle: true,
          titleTextStyle: styleAppbarTitle,
          elevation: 2.0,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.only(top:15,),
          itemCount: HomePage.articles.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15,),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ArticlePage(pageIndex: index)
                  ));},
              child: HomePage.articles[index]
            );
          },
        ),
      ),
    );
  }
}
