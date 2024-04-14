import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ChooseYourLangScreen extends StatefulWidget {
  @override
  State<ChooseYourLangScreen> createState() => _ChooseYourLangScreenState();
}

class _ChooseYourLangScreenState extends State<ChooseYourLangScreen> {
  bool isChecked = false;
  String? selectedLanguage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  'Choose Your Language',
                  style: TextStyle(
                      fontSize: 25.dp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF70415)),
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Morbi nulla ultricies .',
                  style: TextStyle(fontSize: 14.dp, color: Color(0xff808080)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color:selectedLanguage == 'English' ? Color(0xff0038A7) : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: selectedLanguage == 'English' ? Colors.transparent : Color(0xffC4C4C4))
                  ),
                  child: Row(
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                            color: selectedLanguage == 'English' ? Colors.white : Color(0xffC4C4C4),
                            fontSize: 16.dp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Radio<String>(value: 'English',
                          groupValue: selectedLanguage,
                          onChanged: (String? value){
                          setState(() {
                            selectedLanguage = value;
                          });
                          },
                        activeColor: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.h,),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                  decoration: BoxDecoration(
                      color:selectedLanguage == 'Spanish' ? Color(0xff0038A7) : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: selectedLanguage == 'Spanish' ? Colors.transparent : Color(0xffC4C4C4))
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Spanish',
                        style: TextStyle(
                            color: selectedLanguage == 'Spanish' ? Colors.white : Color(0xffC4C4C4),
                            fontSize: 16.dp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Radio<String>(value: 'Spanish',
                        groupValue: selectedLanguage,
                        onChanged: (String? value){
                          setState(() {
                            selectedLanguage = value;
                          });
                        },
                        activeColor: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.h,),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                  decoration: BoxDecoration(
                      color:selectedLanguage == 'Arabic' ? Color(0xff0038A7) : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: selectedLanguage == 'Arabic' ? Colors.transparent : Color(0xffC4C4C4))
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Arabic',
                        style: TextStyle(
                            color: selectedLanguage == 'Arabic' ? Colors.white : Color(0xffC4C4C4),
                            fontSize: 16.dp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Radio<String>(value: 'Arabic',
                        groupValue: selectedLanguage,
                        onChanged: (String? value){
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
                SizedBox(
                  width: 80.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff0038A7)),
                      onPressed: () {},
                      child: Container(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(height: 4.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
