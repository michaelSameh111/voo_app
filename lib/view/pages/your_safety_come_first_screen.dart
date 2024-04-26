import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/background_location_screen.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class YourSafetyComeFirstScreen extends StatefulWidget {
  @override
  State<YourSafetyComeFirstScreen> createState() =>
      _YourSafetyComeFirstScreenState();
}

class _YourSafetyComeFirstScreenState extends State<YourSafetyComeFirstScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Your Safety comes first',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0038A7)),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                    child: Text(
                      'Please check the following safety measures in\n                        order for you to start',
                      style:
                          TextStyle(fontSize: 14.dp, color: Color(0xff808080)),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  ArrowAndText(
                      text:
                          'Check your engine oil level, coolant level and\n windshield washer fluid'),
                  SizedBox(
                    height: 2.h,
                  ),
                  ArrowAndText(
                      text:
                          'Check your lights (such as headlight, fog lights,\n signal lights hazards light, interior light, ....etc).'),
                  SizedBox(
                    height: 2.h,
                  ),
                  ArrowAndText(
                      text:
                          'Check your tire abd rim (includes wheel nuts,\n and tread more than 2/32’ or 1.6mm, no leaking air,\nno swelling, ...etc).'),
                  SizedBox(
                    height: 2.h,
                  ),
                  ArrowAndText(text: 'Check wiper blades working property.'),
                  SizedBox(
                    height: 2.h,
                  ),
                  ArrowAndText(
                      text: 'Check windshield and side mirrors (no cracks)'),
                  SizedBox(
                    height: 2.h,
                  ),
                  ArrowAndText(
                      text:
                          'Check all doors, windows, and trunk working\nproperty.'),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xff0038A7),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Text(
                        'I hereby certify that my vehicle inspection\nreport is true and accurate',
                        style: TextStyle(
                            fontSize: 14.dp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Center(
                    child: MainElevatedButton(
                        nextScreen: BackgroundLocationScreen(), //Background location screen
                        text: 'Next',
                        backgroundColor: Color(0xff0038A7)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ArrowAndText extends StatelessWidget {
  String text;

  ArrowAndText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.keyboard_double_arrow_right_outlined,
          color: Colors.red,
        ),
        Text(text),
      ],
    );
  }
}
