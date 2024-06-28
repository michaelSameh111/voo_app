import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
//ignore_for_file: must_be_immutable
class IconAndTextField extends StatelessWidget {
  Icon icon;
  String hintText;
  TextInputType keyboardType;
  TextEditingController controller;

  IconAndTextField ({super.key,
    required this.icon,
    required this.hintText,
    required this.keyboardType,
    required this.controller
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      iconColor: const Color(0xff808080),
      title: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Color(0xffF5F4F4),
        ),
        child: TextFormField(
          controller: controller,
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
class IconAndTextFieldNumber extends StatelessWidget {
  Icon icon;
  String hintText;
  TextInputType keyboardType;
  TextEditingController controller;

  IconAndTextFieldNumber ({super.key,
    required this.icon,
    required this.hintText,
    required this.keyboardType,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      iconColor: const Color(0xff808080),
      title: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Phone Number is Empty';
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 10,
        decoration: InputDecoration(
            prefixIcon: Center(child: Text('+1',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.dp),)),
            prefixIconConstraints: BoxConstraints(maxWidth: 10.w),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                const BorderSide(color: Colors.transparent)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                const BorderSide(color: Colors.transparent)),
            contentPadding: EdgeInsets.all(15),
            hintText: 'Enter Your Phone Number'),
      ),
    );
  }
}
