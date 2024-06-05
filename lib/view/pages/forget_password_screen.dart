import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/pages/get_your_code_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

import 'login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
       if(state is ForgetPasswordSuccessState){
         Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => LoginScreen()),
                 (route) => false);
         Fluttertoast.showToast(msg: 'Email Sent Successfully',fontSize: 18.dp,textColor: Colors.white,backgroundColor: Colors.green,toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM);
       }
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        'Forget Password',
                        style: TextStyle(
                            fontSize: 30.dp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        'We will send code to your email',
                        style: TextStyle(
                            fontSize: 14.dp, color: const Color(0xff808080)),
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
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is Empty';
                              }
                              return null;
                            },
                            controller: emailController,
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
                                hintText: 'Enter your email address'),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          MainElevatedButtonTwo(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                LoginCubit.get(context).resetPassword(email: emailController.text, context: context);
                              }
                            },
                              circularBorder: true,
                              condition: state is ForgetPasswordLoadingState,
                              text: 'Continue',
                              backgroundColor: const Color(0xffFF6A03)),
                        ],
                      )
                    ],
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
