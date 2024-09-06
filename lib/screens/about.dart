import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:auto_size_text/auto_size_text.dart';

import '../data/data.dart';
import '../models/custom_app_bar.dart';
import '../models/right_drawer.dart';
import 'home.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 8),
          child: const CustomAppBar(title: 'About'),
        ),
        // appBar: AppBar(
        //   // backgroundColor: Colors.amberAccent,
        //   title: const Text("About"),
        //   centerTitle: true,
        //   elevation: 2.0,
        // ),
        endDrawer: const MyDrawer(aa:1),
        // body: LayoutBuilder(
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500.0,
            ),
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Text('Hot reload',
                      style: theme.textTheme.headlineLarge!.copyWith(
                        // fontSize: 28,
                        //// color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: RichText(
                    text: TextSpan(
                      text: 'Flutter\'s hot reload feature helps you quickly and easily experiment, build UIs, add features, and fix bugs. Hot reload works by injecting updated source code files into the running ',
                      style: theme.textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Dart Virtual Machine (VM)',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: '. After the VM updates classes with the new versions of fields and functions, the Flutter framework automatically rebuilds the widget tree, allowing you to quickly view the effects of your changes.',
                          style: theme.textTheme.bodyMedium,
                        )
                      ]
                    )
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0.h, bottom: 10.0.h),
                    child: Text(
                      'How to perform a hot reload',
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 5.0.h),
                  child: Text('To hot reload a Flutter app:', style: theme.textTheme.bodyMedium,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.0.h),
                  child: RichText(
                    text: TextSpan(
                      text: '1. Run the app from a supported ',
                      style: theme.textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Flutter editor',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: ' or a terminal window. Either a physical or virtual device can be the target. ',
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: 'Only Flutter apps in debug mode can be hot reloaded or hot restarted.',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.0.h),
                  child: RichText(
                    text: TextSpan(
                      text: '2. Modify one of the Dart files in your project. Most types of code changes can be hot reloaded; for a list of changes that require a hot restart, see ',
                      style: theme.textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Special cases',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.0.h),
                  child: RichText(
                    text: TextSpan(
                      text: '3. If you\'re working in an IDE/editor that supports Flutter\'s IDE tools, select ',
                      style: theme.textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Save All',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: ' (',
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: 'cmd-s',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: 'ctrl-s',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                        TextSpan(
                          text: '), or click the hot reload button on the toolbar.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 5.0.h),
                  child: Text(
                    'After a successful hot reload operation, you\'ll see a message in the console similar to:', 
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 5.0.h),
                  child: Text(
                    """
                    Performing hot reload...
                    Reloaded 1 of 448 libraries in 978ms.""",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 5.0.h),
                  child: Text(
                    'The app updates to reflect your change, and the current state of the app is preserved. Your app continues to execute from where it was prior to run the hot reload command. The code updates and execution continues.', 
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0.h),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                    },
                    icon: Icon(iconBack, color: theme.colorScheme.onSurface),
                    label: Text(
                      'go back to the list',
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}