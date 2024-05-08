import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class IconAndTextField extends StatelessWidget {
  IconData icon;
  TextInputType keyboardType;
  String hintText;

  IconAndTextField ({
    required this.icon,
    required this.keyboardType,
    required this.hintText,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w,top: 3.h),
      child: Row(
        children: [
          Icon(icon,
            size: 25.dp,
            color: Color(0xff808080),),
          SizedBox(width: 3.w,),
          Container(
            width: 82.w,
            height: 6.h,
            decoration: const BoxDecoration(
              color: Color(0xffF5F4F4),
            ),
            child: TextField(
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.dp)),
                    borderSide: BorderSide(
                        color: Color(0xffF5F4F4)
                    )
                ),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
