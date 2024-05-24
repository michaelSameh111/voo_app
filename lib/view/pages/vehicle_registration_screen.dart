import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:voo_app/view/pages/insurance_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class VehicleRegistrationScreen extends StatelessWidget {
  const VehicleRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Vehicle Registrations',
                            style: TextStyle(
                                fontSize: 25.dp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffF70415)),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          DottedBorder(
                            dashPattern: const [8, 4],
                            color: const Color(0xff808080),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Color(0xffF5F4F4),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.camera_alt_rounded,
                                    size: 45.dp,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Click here to take a clear picture of the\n                     registration card',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            const Color(0xff0038A7)),
                                        onPressed: () {},
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.dp),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Registration Expiration Date',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F4F4),
                          borderRadius: BorderRadius.circular(10)),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'MM / YY'),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(height: 19.h,),
                    MainElevatedButton(
                        nextScreen:
                         InsuranceScreen(), //mo2akatan 3amelha LoginScreen next page
                        text: 'Next',
                        backgroundColor: const Color(0xff0038A7)),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
