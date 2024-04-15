import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class EnableLocationAccessScreen extends StatelessWidget {
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
                  Image(
                      image: AssetImage(
                          'assets/images/enable_location_access_image.png')),
                  Center(
                    child: Text(
                      'Enable Location Access',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0038A7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
