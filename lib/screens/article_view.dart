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

    final styleTitle = theme.textTheme.displayLarge!.copyWith(
      letterSpacing: 4,
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    final styleSubtitle = theme.textTheme.headlineMedium!.copyWith(
      // fontWeight: FontWeight.bold,
    );
    final styleDate = theme.textTheme.headlineSmall!.copyWith(
      // color: Colors.brown,
      color: theme.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );
    final styleContent = theme.textTheme.bodyLarge!.copyWith(
      // fontSize: 15,
      // color: Colors.black,
      // fontWeight: FontWeight.normal,
    );

    // TextStyle styleAppbarTitle = _styleAppbarTitle(context);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amberAccent,
      //   title: const Text("A very interesting article"),
      //   titleTextStyle: styleAppbarTitle,
      //   centerTitle: true,
      //   elevation: 2.0,
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 8),
        child: const CustomAppBar(title: 'A very interesting article'),
      ),

      endDrawer: const MyDrawer(aa:1),
      
      // body: ListView.builder(
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
                // const SizedBox(height: 10),
                Container(
                  color: theme.colorScheme.secondaryContainer,
                  margin: const EdgeInsets.only(bottom: 30.0, left: 8.0, right: 8.0),
                  child: Column(
                    children: [

                      // title
                      Text(
                        '${articlesList[pageIndex].articleTitle.first} ${articlesList[pageIndex].articleTitle.second}',
                        style: styleTitle,
                        // semanticsLabel: "${articlesList[pageIndex].articleTitle.first} ${articlesList[pageIndex].articleTitle.second}"
                      ),
                      // const SizedBox(height: 30),

                      // photo
                      Container(
                        padding: const EdgeInsets.all(20),
                        child:Image.network(articlesList[pageIndex].articleImage),
                        ),

                      // subtitle
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h,),
                        child: Text(
                          articlesList[pageIndex].articleSubtitle,
                          style: styleSubtitle, 
                        ),
                      ),
                      // const SizedBox(height: 20),

                      // date
                      Text(
                        // "${data.articlesList[pageIndex].articleDate.day}-${data.articlesList[pageIndex].articleDate.month}-${data.articlesList[pageIndex].articleDate.year}",
                        DateFormat('dd/MM/yyyy').format(articlesList[pageIndex].articleDate),
                        style: styleDate,
                      ),
                      // SizedBox(height: 30.h),

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
                      // style: TextStyle(fontSize: 20,),
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.primary,
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

  // TextStyle _styleAppbarTitle(BuildContext context) {
  //   final theme = Theme.of(context);
  //   final styleAppbarTitle = theme.textTheme.displayMedium!.copyWith(
  //     fontSize: 25.sp,
  //     color: theme.colorScheme.onTertiary,
  //     fontWeight: FontWeight.bold,
  //   );
  //   return styleAppbarTitle;
  // }
}
