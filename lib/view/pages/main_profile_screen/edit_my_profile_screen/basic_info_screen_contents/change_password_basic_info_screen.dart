import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Login/login_cubit.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

//ignore_for_file: must_be_immutable
class ChangePasswordBasicInfoScreen extends StatelessWidget {
  ChangePasswordBasicInfoScreen({super.key});
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 10.h,
            leadingWidth: 0,
            title: Row(
              children: [
                SizedBox(
                  width: 1.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 20.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'Change Password',
                  style: TextStyle(
                      fontSize: 20.dp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Current Password *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Empty';
                        }
                        return null;
                      },
                      controller: oldPasswordController,
                      onChanged: (value) {},
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Password'),
                    ),
                    // TextButton(
                    //     onPressed: () {
                    //       // Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //         builder: (context) =>
                    //       //             ForgetPasswordScreen()));
                    //     },
                    //     child: const Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Text(
                    //           'Forgot Password ?',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ],
                    //     )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'New Password *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Empty';
                        } else {
                          if (newPasswordController.text !=
                              confirmPasswordController.text) {
                            return 'Password not match';
                          }
                        }
                        return null;
                      },
                      controller: newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Password'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Re-type New Password *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Empty';
                        } else {
                          if (newPasswordController.text !=
                              confirmPasswordController.text) {
                            return 'Password not match';
                          }
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.transparent)),
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Password'),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MainElevatedButtonTwo(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).changePassword(
                                oldPassword: oldPasswordController.text,
                                newPassword: newPasswordController.text,
                                confirmNewPassword:
                                    confirmPasswordController.text,
                                context: context);
                          }
                        },
                        text: 'Update',
                        circularBorder: true,
                        condition: state is ChangePasswordLoadingState,
                        backgroundColor: const Color(0xffFF6A03)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
