// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/custom_app_bar.dart';
import '../models/right_drawer.dart';
import 'home.dart';
import '../data/data.dart';


class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      letterSpacing: 4,
      // color: theme.colorScheme.onSurface,
      color: theme.colorScheme.onSecondaryContainer,
      fontWeight: FontWeight.bold,
    );

    final styleSubtitle = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.onSecondaryContainer,
      // fontWeight: FontWeight.bold,
    );

    final styleDate = theme.textTheme.headlineSmall!.copyWith(
      // color: Colors.brown,
      // color: theme.colorScheme.onTertiary,
      color: theme.colorScheme.onSecondaryContainer,
      fontWeight: FontWeight.bold,
    );

    final styleContent = theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.onSecondaryContainer
    );
  

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 8),
        child: const CustomAppBar(title: 'A very interesting article'),
      ),

      endDrawer: const MyDrawer(aa:1),
      
      
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10.0),
          constraints: const BoxConstraints(
            maxWidth: 500.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: theme.colorScheme.secondaryContainer,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 30.0, left: 8.0, right: 8.0),
                  child: Column(
                    children: [

                      // title
                      Text(
                        '${articlesList[pageIndex].articleTitle.first} ${articlesList[pageIndex].articleTitle.second}',
                        style: styleTitle,
                      ),

                      // photo
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Image.asset(articlesList[pageIndex].articleImage,),
                      ),

                      // subtitle
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          articlesList[pageIndex].articleSubtitle,
                          style: styleSubtitle, 
                        ),
                      ),

                      // date
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(articlesList[pageIndex].articleDate),
                          style: styleDate,
                        ),
                      ),

                      // text = content
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child:
                        Text(
                          articlesList[pageIndex].articleContent,
                          style: styleContent,
                          ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(bottom: 50.0.h),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                    },
                    icon: Icon(iconBack),
                    label: Text('go back to the list', 
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
