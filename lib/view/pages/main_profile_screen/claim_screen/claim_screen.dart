import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/claim_screen/submit_a_complaint_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ClaimScreen extends StatelessWidget {
  const ClaimScreen({super.key});


  //// this screen appears if there are no complaints ////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
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
                child: const Icon(Icons.arrow_back)),
          ),
        ),
        title: Text(
          'Claim',
          style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
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
              text: 'Submit a complaint',
              backgroundColor: const Color(0xffFF6A03)),
         SizedBox(height: 3.h,)
        ],
      ),
    );
  }
}
