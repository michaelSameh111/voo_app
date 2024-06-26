import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
//ignore_for_file: must_be_immutable
class CircledNextButton extends StatelessWidget {
  Widget nextScreen;

  CircledNextButton({required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => nextScreen));
      },
      child: Container(
        width: 17.w,
        height: 17.h,
        decoration: BoxDecoration(
          color: Color(0xff0038A7),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.navigate_next,
          color: Colors.white,
          size: 32.dp,
        ),
      ),
    );
  }
}
class CircledNextButtonTwo extends StatelessWidget {
  final GestureTapCallback? onTap;
  bool? condition;

  CircledNextButtonTwo({required this.onTap,this.condition});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 17.w,
        height: 17.h,
        decoration: BoxDecoration(
          color: Color(0xffFF6A03),
          shape: BoxShape.circle,
        ),
        child: condition == true
            ? Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Icon(
          Icons.navigate_next,
          color: Colors.white,
          size: 32.dp,
        ),
      ),
    );
  }
}
