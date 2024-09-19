import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../data/data.dart';
import '../models/custom_app_bar.dart';
import '../models/right_drawer.dart';
import 'article_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
    Widget build(BuildContext context) {

    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onSurface,
      fontWeight: FontWeight.bold,
    );

    final styleSubtitle = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.onSurface,
      // fontWeight: FontWeight.normal,
    );

    final styleDate = theme.textTheme.titleLarge!.copyWith(
      color: Theme.of(context).colorScheme.tertiary,
      fontWeight: FontWeight.bold,
    );

    Future<bool?> showBackDialog() {
      return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('You are about to leave the App'),
            content: const Text('Do you really want to exit?'),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.tertiary,
                ),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Exit',
                    style: TextStyle(color: theme.colorScheme.onTertiary,),
                    ),
                ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                ),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Go back',
                    style: TextStyle(color: theme.colorScheme.onSecondary,),
                  )
                ),
            ],
          );
        },
      );
    }

    // ModalRoute.of(context)!.isFirst;
    bool canPop = false;

    //     Future<bool> _canPop() async {
    //   if (Navigator.of(context).canPop()) {
    //     canPop = true;
    //     return true;
    //   }
    //   else {
    //     bool shouldExit = await showBackDialog() ?? false;
    //     if (shouldExit) {
    //       SystemNavigator.pop();
    //     }
    //     canPop = false;
    //     return false;
    //   }
    // }

    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        bool shouldPop = await showBackDialog() ?? false;
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },

      child: SafeArea(
        child: Scaffold(
      
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 8),
            child: const CustomAppBar(title: 'List of articles'),
          ),
          // appBar: MyAppBar(appTitle: 1),
      
          endDrawer: const MyDrawer(aa:1),
          
          body: ListView.separated(
              padding: const EdgeInsets.only(top: 15,),
              itemCount: articlesList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15,),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                      // print((ModalRoute.of(context)!.isFirst));
                      
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ArticlePage(pageIndex: index)
                      ));},
                  child: Center( 
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 500.0,),
                      child: Card(
                        elevation: 15,
                        // color: theme.colorScheme.primary,
                        child: Padding(
                          // padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children:[
                              Flexible(
                                // flex: 2,
                                fit: FlexFit.tight,
                                child: Center(
                                  child: Container(
                                    // margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                                    margin: const EdgeInsets.only(left: 10.0),
                                    height: 200.0,
                                    width: 200.0,
                                    // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(articlesList[index].articleImage))),
                                    // child: Image.network(articlesList[index].articleImage, fit: BoxFit.contain,)
                                    // child: Image.file(File(articlesList[index].articleImage), fit: BoxFit.contain,),
                                    child: Image.asset(articlesList[index].articleImage, fit: BoxFit.contain,),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Flexible(
                                // flex: 3,
                                fit: FlexFit.tight,
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      minFontSize: 20,
                                      maxFontSize: 45,
                                      '${articlesList[index].articleTitle.first} ${articlesList[index].articleTitle.second}',
                                      style: styleTitle,
                                      semanticsLabel: "${articlesList[index].articleTitle.first} ${articlesList[index].articleTitle.second}",
                                    ),
                                    AutoSizeText(
                                      minFontSize: 12,
                                      maxFontSize: 28,
                                      "${articlesList[index].articleSubtitle}...",
                                      style: styleSubtitle, 
                                    ),
                                    AutoSizeText(
                                      minFontSize: 12,
                                      maxFontSize: 28,
                                      DateFormat('dd-MM-yyyy').format(articlesList[index].articleDate),
                                      style: styleDate,
                                    ),
                                  ],
                                ),
                              )
                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
    );
  }
}
