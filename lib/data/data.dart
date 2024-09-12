import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/articles.dart';


IconData iconBack = Icons.arrow_back;
IconData iconMode = Icons.dark_mode_outlined;

final List<ArticleList> articlesList = ArticleList.getArticles();

DateTime now = DateTime.now();
// String formattedDate = DateFormat('kk:mm:ss - EEE d MMM y').format(now);
String formattedDate = DateFormat('kk:mm:ss').format(now);
