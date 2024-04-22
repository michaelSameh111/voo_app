import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/enable_location_access_screen.dart';
import 'package:voo_app/view/pages/forget_password_screen.dart';
import 'package:voo_app/view/pages/register_now_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Login',
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
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Password *',
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
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                              hintText: 'Password'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPasswordScreen()));
                              },
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: Color(0xff0038A7),
                            checkColor: Colors.white,
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(fontSize: 14.dp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      MainElevatedButton(
                          nextScreen: EnableLocationAccessScreen(),
                          text: 'Login',
                          backgroundColor: Color(0xff0038A7)),
                      Row(
                        children: [
                          Text('Don\'t have an account ?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterNowScreen()));
                              },
                              child: Text(
                                'Register now',
                                style: TextStyle(color: Color(0xffF70415)),
                              ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
