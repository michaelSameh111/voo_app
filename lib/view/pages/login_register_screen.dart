import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/pages/register_now_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class LoginRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Join Us Today',
                style: TextStyle(
                    fontSize: 25.dp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF70415)),
              ),
              Text(
                'Enter your details to proceed further',
                style: TextStyle(fontSize: 14.dp, color: Color(0xff808080)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Image.asset('assets/images/login_register_screen_image.png'),
              SizedBox(
                height: 4.h,
              ),
              MainElevatedButton(
                  nextScreen: LoginScreen(),
                  text: 'Login',
                  backgroundColor: Color(0xff0038A7)),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 80.w,
                height: 5.5.h,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xff0038A7))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterNowScreen()));
                    },
                    child: Container(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Color(0xff0038A7)),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
