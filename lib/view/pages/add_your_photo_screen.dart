import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/check_info_screen.dart';
import 'package:voo_app/view/widgets/circled_next_button.dart';

class AddYourPhotoScreen extends StatelessWidget {
  const AddYourPhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                Text(
                  'Add your photo',
                  style: TextStyle(
                      fontSize: 25.dp,
                      fontWeight: FontWeight.bold,
                      color:  Colors.black),
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Morbi nulla ultricies .',
                  style: TextStyle(fontSize: 14.dp, color: const Color(0xff808080)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: () {}, //open gallery
                  child: const CircleAvatar(
                    radius: 75.0,
                    backgroundColor: Color(0xffA2A2A2),
                    child: Icon(
                      Icons.person,
                      size: 90.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  width: 80.w,
                  height: 5.5.h,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff808080))),
                      onPressed: () {},
                      child: Text(
                        'Use the outline as a guide',
                        style: TextStyle(
                            color: const Color(0xff808080),
                            fontSize: 15.dp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 27.h,
                ),
                CircledNextButton(
                    nextScreen:
                        const CheckInfoScreen()), // el mafrood go to screen reset password // mo2akatan will go back to login screen
              ],
            ),
          ),
        ),
      ),
    );
  }
}
