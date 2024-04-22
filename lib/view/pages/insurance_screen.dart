import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/location_screen.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class InsuranceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Insurance',
                            style: TextStyle(
                                fontSize: 25.dp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF70415)),
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
                                      'Click here to take a clear picture of the\n                     registration card',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            const Color(0xff0038A7)),
                                        onPressed: () {},
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.dp),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Insurance Expiration Date',
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
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'MM / YY'),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(height: 19.h,),
                    MainElevatedButton(
                        nextScreen:
                        LocationScreen(),
                        text: 'Next',
                        backgroundColor: Color(0xff0038A7)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
