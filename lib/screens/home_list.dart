import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../data/data.dart' as data;
import 'article_view.dart';


class HomePageList extends StatelessWidget {
  const HomePageList({super.key,});

@override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 28,
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 22.sp,
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    final styleSubtitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 15.sp,
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.normal,
    );
    final styleDate = theme.textTheme.displayMedium!.copyWith(
      fontSize: 15.sp,
      color: Colors.red,
      fontWeight: FontWeight.bold,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text("List of articles"),
          centerTitle: true,
          titleTextStyle: styleAppbarTitle,
          elevation: 2.0,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.only(top:15,),
          itemCount: data.articlesList.length,
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
                    maxWidth: 600.0,),
                  child: Card(
                    elevation: 15,
                    color: theme.colorScheme.primary,
                    child: Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                      padding: EdgeInsets.all(8.0.h),
                      child: Row(
                        children:[
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Image.network(data.articlesList[index].articleImage, fit: BoxFit.contain,)),
                          ),
                          SizedBox(
                            width: 12.h,
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Column(
                              children: [
                                // Text(
                                AutoSizeText(
                                  minFontSize: 25,
                                  maxFontSize: 45,
                                  '${data.articlesList[index].articleTitle.first} ${data.articlesList[index].articleTitle.second}',
                                  style: styleTitle,
                                  semanticsLabel: "${data.articlesList[index].articleTitle.first} ${data.articlesList[index].articleTitle.second}",
                                ),
                                // Text(
                                AutoSizeText(
                                  minFontSize: 15,
                                  maxFontSize: 28,
                                  "${data.articlesList[index].articleSubtitle}...",
                                  style: styleSubtitle, 
                                ),
                                // Text(
                                AutoSizeText(
                                  minFontSize: 15,
                                  maxFontSize: 28,
                                  "${data.articlesList[index].articleDate.day}-${data.articlesList[index].articleDate.month}-${data.articlesList[index].articleDate.year}",
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
