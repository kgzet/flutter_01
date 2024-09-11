import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';


class MyClockWidget extends StatefulWidget {
  const MyClockWidget({super.key});

  @override
  State<MyClockWidget> createState() => _MyClockWidgetState();
}

class _MyClockWidgetState extends State<MyClockWidget> {

  String _timeString = "";
  late Timer timer;

  String _formatDateTime(DateTime dateTime) {
    // return DateFormat('kk:mm:ss\nEEE d MMM y').format(now);
    return DateFormat('kk:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    String formattedDate = _formatDateTime(now);
    setState(() {
      _timeString = formattedDate;
    });
  }

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      _timeString,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

}


class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return AutoSizeText(
          // DateFormat('kk:mm:ss\nEEE d MMM y').format(DateTime.now()),
          DateFormat('kk:mm:ss').format(DateTime.now()),
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
