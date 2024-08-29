// import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:random_date/random_date.dart';


class ArticleList{

  final WordPair articleTitle;
  final String articleSubtitle;
  final DateTime articleDate;
  final String articleContent;
  final String articleImage;
  // final String image = "https://images.pexels.com/photos/26555831/pexels-photo-26555831/free-photo-of-przeziebienie-zimny-gora-lodowa-snieg.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

  const ArticleList({
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
    String articleSubtitle = "";
    DateTime articleDate;
    String articleContent;
    String articleImage;

    List adjectivesCopy = List.from(adjectives);
    List nounsCopy = List.from(nouns);
    List imagesCopy = List.from(images);

    for (var i = 0; i < 100; i++) {
      articleTitle = WordPair.random();

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
  
}

extension StringExtensions on String { 
  String capitalize() { 
    return "${this[0].toUpperCase()}${substring(1)}"; 
  } 
}
