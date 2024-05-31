import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voo_app/view/pages/HomePage/Home.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';
//ignore_for_file: must_be_immutable
class Landingpage extends StatefulWidget {
  bool? settings;
  Landingpage({super.key, this.settings});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Exciting News!'),
            content: Text(
              'We\'re excited to inform you that you can now become a Voo VSP partner. Your eligibility to become a partner will be determined based on your performance as a driver. To find out if you\'ve been approved, simply go to your app and click on the partner tab. There, you\'ll also find more information about the partnership program.\n\nWe look forward to seeing you excel with Voo!',
              style: TextStyle(fontSize: 16.0), // Adjust font size as needed
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: widget.settings != true
          ? MainElevatedButton(
              removeRoutes: true,
              backgroundColor: Color(0xffFF6A03),
              text: 'Let\'s Start',
              nextScreen: HomePageMapsScreen(),
            )
          : SizedBox(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We are thrilled to inform you that you now have the opportunity to partner with us. ',
                  style: GoogleFonts.roboto(
                      color: Color(0xffFF6A03),
                      fontWeight: FontWeight.bold,
                      fontSize: 22.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Image.network(
                  'https://innovationscope.com/demos/voo/public/FrontEnd/images/feature-img-2.webp',
                  height: 40.h,
                  width: 80.w,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '''At Voo, we select partners based on their performance. Keep an eye out for notifications and expect a call from us to discuss how you can become a partner and start your own business.
We're excited to help you grow with Voo!
              ''',
                  style: GoogleFonts.roboto(
                      fontSize: 16.dp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
