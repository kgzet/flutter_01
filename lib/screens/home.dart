import 'package:flutter/material.dart';

import '../models/article.dart';
import '../responsive/desktop_home.dart';
import '../responsive/mobile_home.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key,});
  static List<ArticleList> articles = ListGenerator.articlesList;

@override
  Widget build(BuildContext context) {

    if(MediaQuery.sizeOf(context).width < 500){
      return const MobileHomePage();
    }
    else{
      return const DesktopHomePage();
    }
  }
}


class ListGenerator{
  static List<ArticleList> articlesList = ArticleList.getArticles();
}
