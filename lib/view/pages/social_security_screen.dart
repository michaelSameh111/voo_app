import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:pinput/pinput.dart';
import 'package:voo_app/view/pages/bank_account_details.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class SocialSecurityScreen extends StatelessWidget {
  const SocialSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 50.w,
        height: 55.h,
        textStyle: const TextStyle(fontSize: 15, color: Colors.black),
        decoration: BoxDecoration(
            color: Color(0xffC4C4C4),
            borderRadius: BorderRadius.circular(8.dp),
            border: Border.all(color: Colors.transparent)));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(height: 6.h,),
                Center(
                  child: Text(
                    'Social Security',
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
                  '  We’ll need to pay you and to run your\n background check-it won’t be used for\n                      credit check',
                  style: TextStyle(fontSize: 14.dp, color: Color(0xff808080)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Social security number',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 8.h,
                  width: 60.w,
                  child: Pinput(
                    keyboardType: TextInputType.number,
                    length: 3,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: Color(0xff808080)),
                      ),
                    ),
                    onCompleted: (pin) => debugPrint(pin),
                  ),
                ),
                SizedBox(height: 41.h,),
                MainElevatedButton(
                    nextScreen:
                    BankAccountDetailsScreen(),
                    text: 'Next',
                    backgroundColor: Color(0xff0038A7)),
                SizedBox(height: 3.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
