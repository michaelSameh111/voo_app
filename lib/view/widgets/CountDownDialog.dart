import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../Controller/Constants.dart';

class CountdownDialog extends StatefulWidget {
  final VoidCallback onTimerFinish;

  CountdownDialog({required this.onTimerFinish});

  @override
  _CountdownDialogState createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<CountdownDialog> {
  late Timer _timer;
  int _seconds = 30;

  @override
  void initState() {
    super.initState();
    // Start the countdown timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer)async {
      if (_seconds > 0) {
        setState(() {
           player.play(AssetSource('sounds/timer.mp3'));
          _seconds--;
        });
      } else {
        // If timer reaches 0, cancel the timer and invoke the callback
        _timer.cancel();
        widget.onTimerFinish();
      }
    });
  }

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      shape: CircleBorder(

      ),
      content: CircleAvatar(
        radius: 19.5.w,
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0.h),
          child: Column(
            children: [
              Icon(
                Icons.hourglass_top,
                color: const Color(0xffFF6A03),
                size: 30.dp,
              ),
              SizedBox(
                height: 0.6.h,
              ),
              Text(
                '$_seconds',
                style: TextStyle(
                  color: const Color(0xffFF6A03),
                  fontSize: 25.dp,
                ),
              ),
              Text(
                'Seconds',
                style: TextStyle(
                  color: const Color(0xff808080),
                  fontSize: 16.dp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
