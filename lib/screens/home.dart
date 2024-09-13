import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

import '../data/data.dart';
import '../models/custom_app_bar.dart';
import '../models/right_drawer.dart';
import 'article_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key,});

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

    return SafeArea(
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
                              child: Container(
                                margin: const EdgeInsets.only(top: 60.0, bottom: 60.0, left: 10.0),
                                height: 100.0,
                                width: 100.0,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.network(articlesList[index].articleImage, fit: BoxFit.contain,)
                                )
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
    );
  }
}
