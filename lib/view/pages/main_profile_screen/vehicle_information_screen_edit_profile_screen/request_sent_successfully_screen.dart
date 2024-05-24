import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class RequestSentSuccessfullyScreen extends StatelessWidget {
  const RequestSentSuccessfullyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 35.h,),
            Container(
              width: 15.w,
              height: 7.5.h,
              decoration: BoxDecoration(
                color: const Color(0xffffc298),
                borderRadius: BorderRadius.circular(50.dp)
              ),
              child: Icon(Icons.done,
              size: 35.dp,
              color: const Color(0xffff6b02),),
            ),
            SizedBox(height: 3.h,),
            Text('Request sent successfully',
            style: TextStyle(
              color: const Color(0xffFF6A03),
              fontWeight: FontWeight.bold,
              fontSize: 22.dp
            ),),
            SizedBox(height: 0.5.h,),
            Text('We will get in touch in 48 hours.'
                '\nBe ready to for your ride',
            textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.dp),
            ),
            const Spacer(),
            MainElevatedButton(
                nextScreen: const RequestSentSuccessfullyScreen(),
                text: 'Got it',
                backgroundColor: const Color(0xffFF6A03)),
            SizedBox(height: 3.h,)
          ],
        ),
      ),
    );
  }
}
