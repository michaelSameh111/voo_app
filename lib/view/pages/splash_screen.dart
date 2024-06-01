import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/login_register_screen.dart';

import '../../Controller/Login/login_cubit.dart';
import '../../Controller/shared-prefrences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: must_call_super
  @override
  void initState() {
    print(CacheHelper.getData(key: 'loggedin'));
    Timer(const Duration(seconds: 1), () {
      if (CacheHelper.getData(key: 'loggedin') == null) {
        print('nonn');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  LoginRegisterScreen()));
      } else {
        LoginCubit.get(context).userLogin(
            context: context,
            email: CacheHelper.getData(key: 'username'),
            password: CacheHelper.getData(key: 'password'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8.h,),
            Expanded(child: Image.asset('assets/images/car_splash_screen.png',height: 50.h,)),
            Image.asset('assets/images/welcome_splash_screen.png',height: 10.h,),
            SizedBox(
              height: 8.h,
            )
          ],
        ),
      ),
    );
  }
}
