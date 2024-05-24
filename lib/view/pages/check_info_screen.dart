import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/widgets/circled_next_button.dart';

class CheckInfoScreen extends StatelessWidget {
  const CheckInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Check info',
                  style: TextStyle(
                      fontSize: 25.dp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffF70415)),
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur.\n                   Morbi nulla ultricies.',
                  style: TextStyle(fontSize: 14.dp, color: const Color(0xff808080)),
                ),
                SizedBox(
                  height: 60.h,
                ),
                CircledNextButton(nextScreen:  DriverLicenseScreen())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
