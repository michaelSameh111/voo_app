import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen_directory/edit_my_profile_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ChangeLanguageBasicInfoScreen extends StatefulWidget {
  @override
  State<ChangeLanguageBasicInfoScreen> createState() => _ChangeLanguageBasicInfoScreenState();
}

class _ChangeLanguageBasicInfoScreenState extends State<ChangeLanguageBasicInfoScreen> {
  bool isChecked = false;
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditMyProfileScreen()));
            },
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )],
                  shape: BoxShape.circle,
                  color: Colors.white,),
                child: Icon(Icons.arrow_back)),
          ),
        ),
        title: Text('Change Language',
          style: TextStyle(
              fontSize: 20.dp,
              fontWeight: FontWeight.bold
          ),)
        ,
      ),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(height: 5.h,),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w,),
                  decoration: BoxDecoration(
                      color: selectedLanguage == 'English'
                          ? Color(0xff0038A7)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedLanguage == 'English'
                              ? Colors.transparent
                              : Color(0xffC4C4C4))),
                  child: Row(
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                            color: selectedLanguage == 'English'
                                ? Colors.white
                                : Color(0xffC4C4C4),
                            fontSize: 16.dp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Radio<String>(
                        value: 'English',
                        groupValue: selectedLanguage,
                        onChanged: (String? value) {
                          setState(() {
                            selectedLanguage = value;
                          });
                        },
                        activeColor: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w,),
                  decoration: BoxDecoration(
                      color: selectedLanguage == 'Spanish'
                          ? Color(0xff0038A7)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedLanguage == 'Spanish'
                              ? Colors.transparent
                              : Color(0xffC4C4C4))),
                  child: Row(
                    children: [
                      Text(
                        'Spanish',
                        style: TextStyle(
                            color: selectedLanguage == 'Spanish'
                                ? Colors.white
                                : Color(0xffC4C4C4),
                            fontSize: 16.dp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Radio<String>(
                        value: 'Spanish',
                        groupValue: selectedLanguage,
                        onChanged: (String? value) {
                          setState(() {
                            selectedLanguage = value;
                          });
                        },
                        activeColor: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                      color: selectedLanguage == 'Arabic'
                          ? Color(0xff0038A7)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedLanguage == 'Arabic'
                              ? Colors.transparent
                              : Color(0xffC4C4C4))),
                  child: Row(
                    children: [
                      Text(
                        'Arabic',
                        style: TextStyle(
                            color: selectedLanguage == 'Arabic'
                                ? Colors.white
                                : Color(0xffC4C4C4),
                            fontSize: 16.dp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Radio<String>(
                        value: 'Arabic',
                        groupValue: selectedLanguage,
                        onChanged: (String? value) {
                          setState(() {
                            selectedLanguage = value;
                          });
                        },
                        activeColor: Colors.white,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                MainElevatedButton(
                    nextScreen: BasicInfoScreen(),
                    text: 'Next',
                    backgroundColor: Color(0xff0038A7)),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
