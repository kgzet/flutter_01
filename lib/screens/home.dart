import 'package:flutter/material.dart';
import 'article_view.dart';
import '../models/article.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key,});
  // final int? articleIndex;
  static List<ArticleList> articles = ListGenerator.articlesList;

@override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 42,
      color: theme.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        // title: Text(widget.title),
        title: const Text("List of articles"),
        centerTitle: true,
        titleTextStyle: styleAppbarTitle,
        elevation: 2.0,
      ),
      // body: ListView.builder(
      body: ListView.separated(
        padding: const EdgeInsets.only(top:15,),
        itemCount: articles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15,),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ArticlePage(pageIndex: index)
                ));},
            child: articles[index]
          );
        },
      ),
    );
  }
}

class ListGenerator{
  static List<ArticleList> articlesList = ArticleList.getArticles();
}
