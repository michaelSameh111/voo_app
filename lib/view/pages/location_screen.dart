import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 25.dp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF70415)),
                      ),
                      Text(
                        'Select your state and city',
                        style: TextStyle(
                            fontSize: 14.dp, color: Color(0xff808080)),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffF5F4F4),
                        ),
                        child: Center(
                          child: Text(
                            'United States',
                            style: TextStyle(
                                color: Color(0xff0038A7),
                                fontSize: 17.dp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'State',
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
                                  hintText: 'Select state'),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'City',
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
                                  hintText: 'Select city'),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Address',
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
                                  hintText: 'Enter your address'),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Postal code',
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
                                  hintText: 'Enter your postal code'),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                 // Spacer(),
                  SizedBox(height: 10.h,),
                  MainElevatedButton(
                      nextScreen:
                      LoginScreen(), //mo2akatan 3amelha LoginScreen next page
                      text: 'Next',
                      backgroundColor: Color(0xff0038A7)),
                  SizedBox(height: 4.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
