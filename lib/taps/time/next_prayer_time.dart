import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class NextPrayerTime extends StatefulWidget {
  Duration timeRemaining;
  NextPrayerTime({super.key, required this.timeRemaining});

  @override
  State<NextPrayerTime> createState() => _NextPrayerTimeState();
}

class _NextPrayerTimeState extends State<NextPrayerTime> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.timeRemaining.inSeconds > 0) {
          widget.timeRemaining = widget.timeRemaining - Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  String formatDuration(Duration timeRemaining) {
    String hours = (timeRemaining.inHours).toString().padLeft(2, '0');
    String minutes = (timeRemaining.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (timeRemaining.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Next Pray -',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppTheme.black.withAlpha(200),
          ),
        ),
        Text(
          formatDuration(widget.timeRemaining),
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppTheme.black),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.volume_off)),
      ],
    );
  }
}
