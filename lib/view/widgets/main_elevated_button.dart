import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class MainElevatedButton extends StatelessWidget {

  Widget nextScreen;
  String text;
  Color backgroundColor;

  MainElevatedButton({
    required this.nextScreen,
    required this.text,
    required this.backgroundColor
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => nextScreen));
          },
          child: Container(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          )),
    )
    ;
  }
}
