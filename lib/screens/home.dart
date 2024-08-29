import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../models/articles.dart';
import '../data/data.dart' as data;
import 'article_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key,});

@override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 28.sp,
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 24.sp,
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
        body:
          GridView.builder(
            itemCount: data.articlesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0.w,
              mainAxisSpacing: 10.0.w,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (buider, index){
              return
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ArticlePage(pageIndex: index)
                  ));
                  },
                child:Card(
                  elevation: 15,
                  color: theme.colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), 
                    child: Column(
                      children: [
                        Flexible(
                          flex: 5,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0.h, right: 10.0.w, left: 10.0.w),
                            child: Image.network(data.articlesList[index].articleImage),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Text(
                            '${data.articlesList[index].articleTitle.first} ${data.articlesList[index].articleTitle.second}',
                            style: styleTitle,
                            semanticsLabel: "${data.articlesList[index].articleTitle.first} ${data.articlesList[index].articleTitle.second}",
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Text(
                            "${data.articlesList[index].articleSubtitle}...",
                            style: styleSubtitle, 
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(
                            "${data.articlesList[index].articleDate.day}-${data.articlesList[index].articleDate.month}-${data.articlesList[index].articleDate.year}",
                            style: styleDate,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          )
        ),
      );
  }
}
