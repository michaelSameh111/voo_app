import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class InsuranceScreenInEditMyProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                Text(
                  'Insurance Expiration Date',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F4F4),
                      borderRadius: BorderRadius.circular(10)),
                  child: const TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: '3/12/2026'),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(height: 3.h,),
                Container(
                  width: double.infinity,
                  height: 33.h,
                  color: Colors.grey,
                ),
                SizedBox(height: 1.5.h,),
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
                                  builder: (context) => InsuranceScreenInEditMyProfile()));
                        },
                        child: Container(
                          child: Text(
                            'Edit photo',
                            style: TextStyle(color: Color(0xff0038A7)),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: MainElevatedButton(
                      nextScreen:
                      InsuranceScreenInEditMyProfile(), //mo2akatan 3amelha LoginScreen next page
                      text: 'Update',
                      backgroundColor: Color(0xff0038A7)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
