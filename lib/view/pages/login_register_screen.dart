import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/Model/DriverDataModel.dart';
import 'package:voo_app/Model/InsuranceDataModel.dart';
import 'package:voo_app/Model/LicenseDataModel.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/pages/register_now_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class LoginRegisterScreen extends StatefulWidget {
  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  LicenseDataModel licenseDataModel = LicenseDataModel();
  InsuranceDataModel insuranceDataModel = InsuranceDataModel();
  DriverDataModel driverDataModel = DriverDataModel();
  @override
  void initState() {
    // DataCubit.get(context).getDriverLicenseData(licenseDataModel).then((value)=>licenseDataModel = value);
    // DataCubit.get(context).getDriverInsuranceData(insuranceDataModel).then((value)=>insuranceDataModel = value);
    // DataCubit.get(context).getDriverData(driverDataModel).then((value)=>driverDataModel = value);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Join Us Today',
                    style: TextStyle(
                        fontSize: 25.dp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    'Enter your details to proceed further',
                    style: TextStyle(fontSize: 14.dp, color: Color(0xff808080)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset('assets/images/login_register_screen_image.png',),
                  SizedBox(
                    height: 4.h,
                  ),
                  MainElevatedButton(
                    circularBorder: true,
                      nextScreen: LoginScreen(),
                      text: 'Login',
                      backgroundColor: Color(0xffFF6A03)),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    height: 5.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            side: BorderSide(color: Color(0xffFF6A03),),),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterNowScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Color(0xffFF6A03)),
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
