import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/home_page_maps_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class EnableLocationAccessScreen extends StatelessWidget {
  const EnableLocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  const Image(
                      image: AssetImage(
                          'assets/images/enable_location_access_image.png')),
                  SizedBox(height: 7.h,),
                  Text(
                    'Enable Location Access',
                    style: TextStyle(
                        fontSize: 25.dp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff0038A7)),
                  ),
                    SizedBox(height: 1.h,),
                    const Text(
                        'To ensure a seamless and efficient experience,\n '
                            '              allow us access to your location.'),
                  SizedBox(height: 21.h,),
                  MainElevatedButton(nextScreen: const HomePageMapsScreen(),
                      text: 'Allow Location Access',
                      backgroundColor: const Color(0xff0038A7)),
                  TextButton(onPressed: (){},
                      child: Text('Maybe Later', style: TextStyle(color: const Color(0xff0038A7), fontSize: 15.dp),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
