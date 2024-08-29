import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';
import '../data/data.dart' as data;


class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 35.sp,
      color: theme.colorScheme.onSecondary,
      fontWeight: FontWeight.bold,
    );
    final styleSubtitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 24.sp,
      color: const Color.fromARGB(255, 48, 37, 6),
      fontWeight: FontWeight.normal,
    );
    final styleDate = theme.textTheme.displayMedium!.copyWith(
      fontSize: 18.sp,
      color: Colors.brown,
      fontWeight: FontWeight.bold,
    );
    final styleContent = theme.textTheme.displayMedium!.copyWith(
      fontSize: 15,
      // fontSize: 20.sp,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    );

    TextStyle styleAppbarTitle = _styleAppbarTitle(context);
    IconData icon = Icons.arrow_back;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("A very interesting article"),
        titleTextStyle: styleAppbarTitle,
        centerTitle: true,
        elevation: 2.0,
      ),
      // body: ListView.builder(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const SizedBox(height: 10),
            Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              margin: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    '${data.articlesList[pageIndex].articleTitle.first} ${data.articlesList[pageIndex].articleTitle.second}',
                    style: styleTitle,
                    semanticsLabel: "${data.articlesList[pageIndex].articleTitle.first} ${data.articlesList[pageIndex].articleTitle.second}"
                  ),
                  // const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(30),
                    child:Image.network(data.articlesList[pageIndex].articleImage),
                    ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h,),
                    child: Text(
                      data.articlesList[pageIndex].articleSubtitle,
                      style: styleSubtitle, 
                    ),
                  ),
                  // const SizedBox(height: 20),
                  Text(
                    // "${data.articlesList[pageIndex].articleDate.day}-${data.articlesList[pageIndex].articleDate.month}-${data.articlesList[pageIndex].articleDate.year}",
                    DateFormat('dd/MM/yyyy').format(data.articlesList[pageIndex].articleDate),
                    style: styleDate,
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    Text(
                      data.articlesList[pageIndex].articleContent,
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
                icon: Icon(icon),
                label: Text('go back to the list', style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _styleAppbarTitle(BuildContext context) {
    final theme = Theme.of(context);
    final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
      fontSize: 25.sp,
      color: theme.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );
    return styleAppbarTitle;
  }
}
