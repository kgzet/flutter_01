import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:auto_size_text/auto_size_text.dart';

import 'home.dart';
import '../models/article.dart';


class ArticlePage extends StatelessWidget {
  ArticlePage({super.key, required this.pageIndex});
  // const ArticlePage({super.key});

  final int pageIndex;
  final List<ArticleList> articles = ListGenerator.articlesList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 75,
      color: theme.colorScheme.onSecondary,
      fontWeight: FontWeight.bold,
    );
    final styleSubtitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 35,
      // color: theme.colorScheme.onTertiary,
      color: const Color.fromARGB(255, 48, 37, 6),
      fontWeight: FontWeight.normal,
    );
    final styleDate = theme.textTheme.displayMedium!.copyWith(
      fontSize: 25,
      color: theme.colorScheme.onSecondary,
      fontWeight: FontWeight.bold,
    );
    final styleContent = theme.textTheme.displayMedium!.copyWith(
      fontSize: 15,
      // fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    );

    TextStyle styleAppbarTitle = _styleAppbarTitle(context);
    IconData icon = Icons.arrow_back;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("A very interesting article"),
        titleTextStyle: styleAppbarTitle,
        centerTitle: true,
        elevation: 2.0,
      ),
      // body: ListView.builder(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const SizedBox(height: 10),
            Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              margin: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    '${articles[pageIndex].articleTitle.first} ${articles[pageIndex].articleTitle.second}',
                    style: styleTitle,
                    semanticsLabel: "${articles[pageIndex].articleTitle.first} ${articles[pageIndex].articleTitle.second}"
                  ),
                  // const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(30),
                    child:Image.network(articles[pageIndex].articleImage),
                    ),
                  Container(
                    padding: const EdgeInsets.only(right: 20.0, left: 20, top: 10, bottom: 10),
                    child: Text(
                      articles[pageIndex].articleSubtitle,
                      style: styleSubtitle, 
                    ),
                  ),
                  // const SizedBox(height: 20),
                  Text(
                    // "${articles[pageIndex].articleDate.day}-${articles[pageIndex].articleDate.month}-${articles[pageIndex].articleDate.year}",
                    DateFormat('dd/MM/yyyy').format(articles[pageIndex].articleDate),
                    style: styleDate,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    Text(
                      articles[pageIndex].articleContent,
                      style: styleContent,
                      ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                icon: Icon(icon),
                label: const Text('go back to the list'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _styleAppbarTitle(BuildContext context) {
    final theme = Theme.of(context);
    final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 42,
      color: theme.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );
    return styleAppbarTitle;
  }
}
