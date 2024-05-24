import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: must_call_super
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginRegisterScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/VOO_logo_splash_screen.png'),
          Expanded(child: Image.asset('assets/images/car_splash_screen.png')),
          Image.asset('assets/images/welcome_splash_screen.png'),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
