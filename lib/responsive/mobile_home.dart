import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/article_view.dart';


List articlesCopy = List.from(HomePage.articles);

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 42,
      color: theme.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );

    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 40,
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    final styleSubtitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 25,
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.normal,
    );
    final styleDate = theme.textTheme.displayMedium!.copyWith(
      fontSize: 25,
      color: Colors.red,
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
              child: Card(
                elevation: 15,
                color: theme.colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0), 
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
                        child: Image.network(HomePage.articles[index].articleImage),
                      ),
                      Text(
                        '${HomePage.articles[index].articleTitle.first} ${HomePage.articles[index].articleTitle.second}',
                        style: styleTitle,
                        semanticsLabel: "${HomePage.articles[index].articleTitle.first} ${HomePage.articles[index].articleTitle.second}",
                      ),
                      Text(
                        "${HomePage.articles[index].articleSubtitle}...",
                        style: styleSubtitle, 
                      ),
                      Text(
                        "${HomePage.articles[index].articleDate.day}-${HomePage.articles[index].articleDate.month}-${HomePage.articles[index].articleDate.year}",
                        style: styleDate,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
