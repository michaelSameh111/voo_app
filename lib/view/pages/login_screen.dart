import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/view/pages/forget_password_screen.dart';
import 'package:voo_app/view/pages/register_now_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

import '../../Controller/Login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          'Login',
                          style: GoogleFonts.roboto(
                              fontSize: 25.dp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 1.h,),
                        Text(
                          'Enter your details to proceed further',
                          style: GoogleFonts.roboto(
                              fontSize: 16.dp, color: Color(0xff808080),fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Email *',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 15.dp),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                return null;
                              },
                              controller: loginEmailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.transparent)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.transparent)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.transparent)),
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: 'Email'),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Password *',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 15.dp),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                              controller: loginPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.transparent)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.transparent)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.transparent)),
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: 'Password'),
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
                                      style: GoogleFonts.roboto(color: Colors.black),
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                  activeColor: Color(0xffFF6A03),
                                  checkColor: Colors.white,
                                ),
                                Text(
                                  'Remember me',
                                  style: GoogleFonts.roboto(fontSize: 14.dp),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            MainElevatedButtonTwo(
                              circularBorder: true,
                              condition: state is LoginLoadingState,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        email: loginEmailController.text,
                                        password: loginPasswordController.text,
                                        context: context);
                                  }
                                },
                                text: 'Login',
                                backgroundColor: Color(0xffFF6A03)),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
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
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,fontSize: 15.dp,fontWeight: FontWeight.bold),
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
          ),
        );
      },
    );
  }
}
