import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voo_app/Controller/Terms&Conditions.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

import '../../Controller/Login/login_cubit.dart';

class RegisterNowScreen extends StatefulWidget {
  @override
  State<RegisterNowScreen> createState() => _RegisterNowScreenState();
}

class _RegisterNowScreenState extends State<RegisterNowScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool hasUppercaseBool = false;
  bool hasLowercaseBool = false;
  bool hasNumberBool = false;
  bool hasSpecialCharacterBool = false;
  bool characterNumber = false;
  bool termsAndConditions = false;
  File? file;
  final List<String> gender = [
    'Choose gender',
    'Male',
    'Female',
  ];
  String? selectedValue = 'Choose gender';

  TextEditingController dateController = TextEditingController();
  final selectedGender = TextEditingController();
  String genderSelected = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 5.h),
                        Column(
                          children: [
                            Text(
                              'Register Now',
                              style: GoogleFonts.roboto(
                                  fontSize: 25.dp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              'Enter your details to proceed further',
                              style: GoogleFonts.roboto(
                                  fontSize: 14.dp, color: Color(0xff808080)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                          onTap: ()  async{

                           await  LoginCubit.get(context).pickImage(image: LoginCubit.registerImage,frontCamera: true).then((value){
                               setState(() {
                                 LoginCubit.registerImage = value;
                               });
                             });
                          },
                          child: CircleAvatar(
                            radius: 13.w,
                            backgroundColor: Color(0xffA2A2A2),
                            child: LoginCubit.registerImage != null
                                ? CircleAvatar(
                                radius: 13.w,
                                backgroundColor: Color(0xffA2A2A2),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      LoginCubit.registerImage!,
                                      fit: BoxFit.fill,
                                      height: 300,
                                      width: 300,
                                    )))
                                : Icon(
                              Icons.person,
                              size: 18.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: ()  {
                               LoginCubit.get(context).pickImage(image: LoginCubit.registerImage,frontCamera: true);
                              setState(() {});
                            },
                            child: Text(
                              'Add your photo',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 15.dp,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'First Name *',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 15.dp),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Name is Empty';
                            }
                            return null;
                          },
                          controller: firstNameController,
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
                              hintText: 'First Name'),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        // Text(
                        //   'Middle Name *',
                        //   style:
                        //       GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 15.dp),
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Color(0xffF5F4F4),
                        //       borderRadius: BorderRadius.circular(10)),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         contentPadding: EdgeInsets.all(15),
                        //         hintText: 'Middle Name'),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        Text(
                          'Last Name *',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 15.dp),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last Name is Empty';
                            }
                            return null;
                          },
                          controller: lastNameController,
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
                              hintText: 'Last Name'),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Phone number *',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 15.dp),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone Number is Empty';
                            }
                            return null;
                          },
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            prefixIcon: Center(child: Text('+1',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.dp),)),
                              prefixIconConstraints: BoxConstraints(maxWidth: 10.w),
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
                              hintText: 'Enter Your Phone Number'),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Date of Birth *',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 15.dp),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Date of birth is Empty';
                            }
                            return null;
                          },
                          readOnly: true,
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
                              hintText: 'Choose your date of birth',
                              prefixIcon: Icon(Icons.calendar_today)),
                          onTap: () {
                            selectDate();
                          },
                          controller: dateController,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Gender *',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 15.dp),
                        ),
                        DropdownButtonFormField<String>(

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
                          ),
                          validator: (value) {
                            if (value == 'Choose gender') {
                              return 'Please choose gender';
                            }
                            return null;
                          },
                          items: gender
                              .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: GoogleFonts.roboto(
                                fontSize: 14.dp,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Email Address*',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 15.dp),
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
                              return 'Password is Empty';
                            }
                            return null;
                          },
                          controller: passwordController,
                          onChanged: (value) {
                            setState(() {
                              hasUppercaseBool = hasUppercase(value);
                              hasLowercaseBool = hasLowercase(value);
                              hasNumberBool = hasNumber(value);
                              hasSpecialCharacterBool = hasSpecialCharacter(value);
                              characterNumber = value.length >= 8;
                            });
                          },
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Has Upper Case',
                              style: hasUppercaseBool
                                  ? TextStyle(color: Colors.green, fontSize: 14.dp)
                                  : TextStyle(
                                color: Colors.grey,
                                fontSize: 14.dp,
                              ),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Has Lower Case',
                              style: hasLowercaseBool
                                  ? TextStyle(color: Colors.green, fontSize: 14.dp)
                                  : TextStyle(
                                color: Colors.grey,
                                fontSize: 14.dp,
                              ),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Has Number',
                              style: hasNumberBool
                                  ? TextStyle(color: Colors.green, fontSize: 14.dp)
                                  : TextStyle(
                                color: Colors.grey,
                                fontSize: 14.dp,
                              ),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Has Special Character',
                              style: hasSpecialCharacterBool
                                  ? TextStyle(color: Colors.green, fontSize: 14.dp)
                                  : TextStyle(
                                color: Colors.grey,
                                fontSize: 14.dp,
                              ),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '8 Characters or more',
                              style: characterNumber
                                  ? TextStyle(color: Colors.green, fontSize: 14.dp)
                                  : TextStyle(
                                color: Colors.grey,
                                fontSize: 14.dp,
                              ),
                            )),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Confirm Password *',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 15.dp),
                        ),
                        TextFormField(
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Empty';
                            } else if (value != passwordController.text) {
                              return 'Password Doesn\'t match';
                            }
                            return null;
                          },
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
                              hintText: 'Confirm Password'),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: termsAndConditions,
                              onChanged: (bool? value) {
                                setState(() {
                                  termsAndConditions = value!;
                                });
                              },
                              activeColor: Color(0xffFF6A03),
                              checkColor: Colors.white,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'You agree to our ',
                                  style: GoogleFonts.roboto(fontSize: 14.dp,color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Terms & Conditions',
                                      style: GoogleFonts.roboto(fontSize: 14.dp, color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        showTermsAndConditionsDialog(context);
                                        },
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: GoogleFonts.roboto(fontSize: 14.dp),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: GoogleFonts.roboto(fontSize: 14.dp, color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        showPrivacyPolicyDialog(context);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        MainElevatedButtonTwo(
                            condition: state is RegisterLoadingState || state is LoginLoadingState,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                termsAndConditions ? LoginCubit.get(context).registerUser(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phone: '+1${phoneNumberController.text}',
                                    password: passwordController.text,
                                    passwordConfirmation:
                                    confirmPasswordController.text,
                                    context: context,
                                    birthDate: dateController.text,
                                    gender: selectedValue!,
                                    file: LoginCubit.registerImage) : print('Hello');
                              }
                            },
                            text: 'Register',
                            circularBorder: true,
                            backgroundColor: termsAndConditions ? Color(0xffFF6A03) : Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already a user ?',
                              style: GoogleFonts.roboto(
                                  fontSize: 15.dp, color: Color(0xff646363)),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  'Login',
                                  style:
                                  GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.dp),
                                ))
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

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}

bool hasUppercase(String password) {
  return password.contains(RegExp(r'[A-Z]'));
}

bool hasLowercase(String password) {
  return password.contains(RegExp(r'[a-z]'));
}

bool hasNumber(String password) {
  return password.contains(RegExp(r'[0-9]'));
}

bool hasSpecialCharacter(String password) {
  return password.contains(RegExp(r'[^\w\s]|_'));
}
