import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';


class ForgetPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  'Forget Password',
                  style: TextStyle(
                      fontSize: 25.dp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF70415)),
                ),
                Text(
                  'We sent you a code to verify your email \n address',
                  style: TextStyle(fontSize: 14.dp, color: Color(0xff808080)),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Email *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF5F4F4),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'Email'),
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    SizedBox(
                      width: 80.w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff0038A7)),
                          onPressed: () {},
                          child: Container(
                            child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),

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
