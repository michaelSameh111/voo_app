import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/view/pages/location_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';
//ignore_for_file: must_be_immutable
class SocialSecurityScreen extends StatelessWidget {
  SocialSecurityScreen({Key? key}) : super(key: key);
  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();
  TextEditingController controllerThree = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //     width: 50.w,
    //     height: 55.h,
    //     textStyle: const TextStyle(fontSize: 15, color: Colors.black),
    //     decoration: BoxDecoration(
    //         color: Color(0xffC4C4C4),
    //         borderRadius: BorderRadius.circular(8.dp),
    //         border: Border.all(color: Colors.transparent)));
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 6.h,),
                    Center(
                      child: Text(
                        'Social Security',
                        style: TextStyle(
                            fontSize: 25.dp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffF70415)),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      '  We’ll need to pay you and to run your\n background check-it won’t be used for\n                      credit check',
                      style: TextStyle(fontSize: 14.dp, color: const Color(0xff808080)),
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
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controllerOne,
                            maxLength: 3, // Limit input to 4 digits
                            keyboardType: TextInputType.number, // Enforce numeric input
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (value.length < 3) {
                                return 'Please enter 3 digits'; // Inform user about the limit
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (value.length == 3) {
                                FocusScope.of(context).nextFocus(); // Move focus to next field
                              }
                            },
                            // controller: stateController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffC4C4C4),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: TextFormField(
                            controller: controllerTwo,
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (value.length < 3) {
                                return 'Please enter 3 digits';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (value.length == 3) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            // controller: stateController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffC4C4C4),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: TextFormField(
                            controller: controllerThree,
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (value.length < 3) {
                                return 'Please enter 3 digits';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xffC4C4C4),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)),
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 41.h,),
                    MainElevatedButtonTwo(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            socialSecurity = '${controllerOne.text} ${controllerTwo.text} ${controllerThree.text}';
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen())).whenComplete((){
                              print(socialSecurity);
                            });
                          }
                        },
                        text: 'Next',
                        backgroundColor: const Color(0xff0038A7)),
                    SizedBox(height: 3.h,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
