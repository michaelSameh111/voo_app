import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/your_safety_come_first_screen.dart';

class WeWillReviewScreen extends StatelessWidget {
  const WeWillReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/we_will_review_image_screen.png'),
              SizedBox(height: 1.h,),
              TextButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const YourSafetyComeFirstScreen()));
              },
                  child: const Text('Go to (your safety come first screen)'))
            ],
          )),

    );
  }
}
