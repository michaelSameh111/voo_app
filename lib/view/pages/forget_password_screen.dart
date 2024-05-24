import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/get_your_code_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                      color: const Color(0xffF70415)),
                ),
                Text(
                  'We sent you a code to verify your email \n address',
                  style: TextStyle(fontSize: 14.dp, color: const Color(0xff808080)),
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
                          color: const Color(0xffF5F4F4),
                          borderRadius: BorderRadius.circular(10)),
                      child: const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'Email'),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    MainElevatedButton(
                        nextScreen: const GetYourCodeScreen(),
                        text: 'Continue',
                        backgroundColor: const Color(0xff0038A7)),
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
