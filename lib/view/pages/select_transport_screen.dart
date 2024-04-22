import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/pages/vehicle_registration_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class SelectTransportScreen extends StatefulWidget {
  const SelectTransportScreen({Key? key}) : super(key: key);

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;
  bool? isChecked5 = false;
  bool? isChecked6 = false;
  bool? isChecked7 = false;
  bool? isChecked8 = false;
  bool isChecked = false;

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(padding: EdgeInsets.all(20.dp),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Select Year',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF70415)),
                    ),
                  ),
                  Row(
                    children: [
                      Text('2004',style: TextStyle(fontSize: 15.dp),),
                      Spacer(),
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
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2005',style: TextStyle(fontSize: 15.dp),),
                      Spacer(),
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
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2006',style: TextStyle(fontSize: 15.dp),),
                      Spacer(),
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
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2007',style: TextStyle(fontSize: 15.dp),),
                      Spacer(),
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
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text('2008',style: TextStyle(fontSize: 15.dp),),
                      Spacer(),
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
                    ],
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                    'Select Transport ',
                    style: TextStyle(
                        fontSize: 25.dp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF70415)),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Car Brand *',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Ex. Toyota'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Model',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select Model'),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Plate number *',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Enter plate number'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Year',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onTap: showBottomSheet,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Year'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Ride Settings',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value;
                            });
                            if (isChecked2 == true) {
                              setState(() {
                                isChecked1 == false;
                              });
                            }
                          }),
                    ),
                    Text(
                      'Ride people',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value;
                            });
                            if (isChecked1 == true) {
                              setState(() {
                                isChecked2 == false;
                              });
                            }
                          }),
                    ),
                    Text(
                      'Packages / Bulk packages',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Select car type',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked3,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked3 = value;
                            });
                          }),
                    ),
                    Text(
                      'VX',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked4,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked4 = value;
                            });
                          }),
                    ),
                    Text(
                      'Vcomfy',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Wheelchair access',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked5,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked5 = value;
                            });
                          }),
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked6,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked6 = value;
                            });
                          }),
                    ),
                    Text(
                      'No',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Child car seat',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked7,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked7 = value;
                            });
                          }),
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          activeColor: Color(0xff0038A7),
                          shape: CircleBorder(),
                          value: isChecked8,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked8 = value;
                            });
                          }),
                    ),
                    Text(
                      'No',
                      style: TextStyle(fontSize: 16.dp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'No of seats *',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select type'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Number of doors',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Number of doors'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Car fuel type',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select fuel type'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Car documents',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Add document details'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Car images',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Add car details'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: MainElevatedButton(
                      nextScreen:
                      VehicleRegistrationScreen(),
                      text: 'Next',
                      backgroundColor: Color(0xff0038A7)),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
