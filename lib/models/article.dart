import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:random_date/random_date.dart';


class ArticleList extends StatelessWidget {

  final WordPair articleTitle;
  final String articleSubtitle;
  final DateTime articleDate;
  final String articleContent;
  final String articleImage;
  // final String image = "https://images.pexels.com/photos/26555831/pexels-photo-26555831/free-photo-of-przeziebienie-zimny-gora-lodowa-snieg.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

  const ArticleList({
    super.key,
    required this.articleTitle,
    required this.articleSubtitle,
    required this.articleDate,
    required this.articleContent,
    required this.articleImage,
  });

  static List<ArticleList> getArticles(){
    List<ArticleList> articles = [];

    
    List<String> images = ['https://images.pexels.com/photos/26707538/pexels-photo-26707538/free-photo-of-snieg-natura-las-drzewa.jpeg',
      'https://images.pexels.com/photos/26617846/pexels-photo-26617846/free-photo-of-pole-kurz-pyl-gospodarstwo.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/26455238/pexels-photo-26455238/free-photo-of-morze-ocean-gleboki-plywanie.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/26570912/pexels-photo-26570912/free-photo-of-natura-plywanie-podwodny-fotografia-zwierzecia.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/26045508/pexels-photo-26045508/free-photo-of-delfiny-z-baja-california-sur.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/26555831/pexels-photo-26555831/free-photo-of-przeziebienie-zimny-gora-lodowa-snieg.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ];

    String temp = "";
    WordPair articleTitle;
    // WordPair articleSubtitle;
    String articleSubtitle = "";
    DateTime articleDate;
    String articleContent;
    String articleImage;

    List adjectivesCopy = List.from(adjectives);
    List nounsCopy = List.from(nouns);
    List imagesCopy = List.from(images);

    for (var i = 0; i < 100; i++) {
      articleTitle = WordPair.random();
      // articleSubtitle = WordPair.random();

      adjectivesCopy.shuffle();
      temp = adjectivesCopy[0];
      articleSubtitle = "${temp.capitalize()} ";
      for(var j = 0; j < 3; j++){
        adjectivesCopy.shuffle();
        articleSubtitle += adjectivesCopy[0];
        articleSubtitle += " ";
        nounsCopy.shuffle();
        articleSubtitle += nounsCopy[0];
        articleSubtitle += " ";
      }
      // articleSubtitle += "...";

      articleDate = RandomDate.withRange(2020, 2024).random();

      adjectivesCopy.shuffle();
      temp = adjectivesCopy[0];
      articleContent = "${temp.capitalize()} ";
      articleContent="";
      for(var l = 0; l < 50; l++){
        adjectivesCopy.shuffle();
        articleContent += adjectivesCopy[0];
        articleContent += " ";
        nounsCopy.shuffle();
        articleContent += nounsCopy[0];
        articleContent += " ";
      }

      imagesCopy.shuffle();
      articleImage = imagesCopy[0];
      
      articles.add(ArticleList(
        articleTitle: articleTitle,
        articleSubtitle: articleSubtitle,
        articleDate: articleDate,
        articleContent: articleContent,
        articleImage: articleImage,
      ));
    }
    return articles;
  }
  

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 30,
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

    String formattedDate = "${articleDate.day}-${articleDate.month}-${articleDate.year}";

    // return FittedBox(
    return Center(
      child: Card(
        elevation: 15,
        color: theme.colorScheme.primary,
        // onPressed
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  '$articleImage',
                  width: 300,
                  height: 150,
                  fit:BoxFit.fill),
                // child:Image.network(articleImage),
              ),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${articleTitle.first} ${articleTitle.second}',
                        style: styleTitle,
                        semanticsLabel: "${articleTitle.first} ${articleTitle.second}",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "$articleSubtitle...",
                        style: styleSubtitle, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        formattedDate,
                        style: styleDate,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtensions on String { 
  String capitalize() { 
    return "${this[0].toUpperCase()}${substring(1)}"; 
  } 
}
