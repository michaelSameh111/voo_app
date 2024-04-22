import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/pages/select_transport_screen.dart';
import 'package:voo_app/view/widgets/circled_next_button.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class DriverLicenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                    'Driver\'s License ',
                    style: TextStyle(
                        fontSize: 25.dp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF70415)),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'To prevent delays , make sure your driver\'s license : \n'
                  ' - Is current (not expired).\n'
                  ' - Is not blurry.\n'
                  ' - Includes all four corners of the card',
                  style: TextStyle(fontSize: 14.dp, color: Color(0xff808080)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                DottedBorder(
                  dashPattern: [8, 4],
                  color: Color(0xff808080),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          size: 45.dp,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Click here to upload a clear pictue of\n              front of driver\'s license',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MainElevatedButton(
                            nextScreen:
                                LoginScreen(), //mo2akatan 3amelha LoginScreen next page
                            text: 'Upload',
                            backgroundColor: Color(0xff0038A7)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                DottedBorder(
                  dashPattern: [8, 4],
                  color: Color(0xff808080),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          size: 45.dp,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Click here to upload a clear pictue of\n              back of driver\'s license',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MainElevatedButton(
                            nextScreen:
                            LoginScreen(), //mo2akatan 3amelha LoginScreen next page
                            text: 'Upload',
                            backgroundColor: Color(0xff0038A7)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Driver License Number',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Enter your driver license number'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Expiration Date',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'MM / YY'),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Center(child: CircledNextButton(nextScreen: SelectTransportScreen())),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
