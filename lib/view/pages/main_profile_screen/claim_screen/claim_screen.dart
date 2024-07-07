import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/claim_screen/submit_a_complaint_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ClaimScreen extends StatelessWidget {
  const ClaimScreen({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
              'Claim',
              style: TextStyle(
                  fontSize: 20.dp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image(
            image: const AssetImage('assets/images/claim_image.png'),
            height: 60.h,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(),
          MainElevatedButton(
              nextScreen: const SubmitAComplaintScreen(),
              text: 'Submit a complaint',circularBorder: true,
              backgroundColor: const Color(0xffFF6A03)),
         SizedBox(height: 3.h,)
        ],
      ),
    );
  }
}
