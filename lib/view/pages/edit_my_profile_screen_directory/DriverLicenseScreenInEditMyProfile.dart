import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class DriverLicenseScreenInEditMyProfile extends StatelessWidget {
  const DriverLicenseScreenInEditMyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                Text('Driver License Number',
                style: TextStyle(
                  fontSize: 15.dp,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 1.h,),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Color(0xffF5F4F4),
                  ),
                  child: TextField(
                    readOnly: true,
                    //keyboardType: keyboardType,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '1245 2356',
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                DottedBorder(
                  dashPattern: [8, 4],
                  color: Color(0xff808080),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
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
                          child: Text(
                            'Click here to upload a clear pictue of\n              front of driver\'s license',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MainElevatedButton(
                            nextScreen:
                            DriverLicenseScreenInEditMyProfile(), //mo2akatan 3amelha LoginScreen next page
                            text: 'Upload',
                            backgroundColor: Color(0xff0038A7)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                Center(
                  child: SizedBox(
                    width: 40.w,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff0038A7))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverLicenseScreenInEditMyProfile()));
                        },
                        child: Container(
                          child: Text(
                            'Edit photo',
                            style: TextStyle(color: Color(0xff0038A7)),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 4.h,),
                DottedBorder(
                  dashPattern: [8, 4],
                  color: Color(0xff808080),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
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
                          child: Text(
                            'Click here to upload a clear pictue of\n              front of driver\'s license',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MainElevatedButton(
                            nextScreen:
                            DriverLicenseScreenInEditMyProfile(), //mo2akatan 3amelha LoginScreen next page
                            text: 'Upload',
                            backgroundColor: Color(0xff0038A7)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                Center(
                  child: SizedBox(
                    width: 40.w,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff0038A7))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverLicenseScreenInEditMyProfile()));
                        },
                        child: Container(
                          child: Text(
                            'Edit photo',
                            style: TextStyle(color: Color(0xff0038A7)),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  'Expiration Date',
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
                        hintText: 'MM / YY'),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: MainElevatedButton(
                      nextScreen:
                      DriverLicenseScreenInEditMyProfile(), //mo2akatan 3amelha LoginScreen next page
                      text: 'Update',
                      backgroundColor: Color(0xff0038A7)),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
