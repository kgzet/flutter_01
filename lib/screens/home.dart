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
    // final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      // fontSize: 28,
      // color: theme.colorScheme.onPrimary,
      // fontWeight: FontWeight.bold,
    // );

    final styleTitle = theme.textTheme.displaySmall!.copyWith(
      // fontSize: 22.sp,
      // color: theme.colorScheme.onPrimary,
      // color: theme.colorScheme.primary,
      color: theme.colorScheme.onSurface,
      fontWeight: FontWeight.bold,
    );
    final styleSubtitle = theme.textTheme.headlineSmall!.copyWith(
      // fontSize: 15.sp,
      // color: theme.colorScheme.onPrimary,
      // color: theme.colorScheme.secondary,
      color: theme.colorScheme.onSurface,
      // fontWeight: FontWeight.normal,
    );
    final styleDate = theme.textTheme.titleLarge!.copyWith(
      // fontSize: 15.sp,
      // color: Colors.red,
      color: Theme.of(context).colorScheme.tertiary,
      fontWeight: FontWeight.bold,
    );

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 8),
          child: const CustomAppBar(title: 'List of articles'),
        ),
        // appBar: AppBar(
        //   // backgroundColor: Colors.amberAccent,
        //   title: const Text("List of articles"),
        //   centerTitle: true,
        //   titleTextStyle: styleAppbarTitle,
        //   elevation: 2.0,
        //   // formattedDate
        // ),
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
                      // color: theme.colorScheme.onSurface,
                      child: Padding(
                        // padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:[
                            Flexible(
                              // flex: 2,
                              fit: FlexFit.tight,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Image.network(articlesList[index].articleImage, fit: BoxFit.contain,)),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Flexible(
                              // flex: 3,
                              fit: FlexFit.tight,
                              child: Column(
                                children: [
                                  // Text(
                                  AutoSizeText(
                                    minFontSize: 25,
                                    maxFontSize: 45,
                                    '${articlesList[index].articleTitle.first} ${articlesList[index].articleTitle.second}',
                                    style: styleTitle,
                                    semanticsLabel: "${articlesList[index].articleTitle.first} ${articlesList[index].articleTitle.second}",
                                  ),
                                  // Text(
                                  AutoSizeText(
                                    minFontSize: 15,
                                    maxFontSize: 28,
                                    "${articlesList[index].articleSubtitle}...",
                                    style: styleSubtitle, 
                                  ),
                                  // Text(
                                  AutoSizeText(
                                    minFontSize: 15,
                                    maxFontSize: 28,
                                    // "${articlesList[index].articleDate.day}-${articlesList[index].articleDate.month}-${articlesList[index].articleDate.year}",
                                    DateFormat('dd-MM-yyyy').format(articlesList[index].articleDate),
                                    style: styleDate,
                                  ),
                                  Text(MediaQuery.of(context).size.toString()),
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
