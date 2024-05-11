import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class IconAndTextField extends StatelessWidget {
  Icon icon;
  String hintText;
  TextInputType keyboardType;

  IconAndTextField ({
    required this.icon,
    required this.hintText,
    required this.keyboardType,
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      iconColor: Color(0xff808080),
      title: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Color(0xffF5F4F4),
        ),
        child: TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
