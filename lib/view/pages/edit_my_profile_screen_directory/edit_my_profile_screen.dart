import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/DriverLicenseScreenInEditMyProfile.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/InsuranceScreenInEditMyProfile.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/basic_info.dart';
import 'package:voo_app/view/pages/insurance_screen.dart';
//import 'package:voo_app/lib/view/pages/edit_my_profile_screen_directory/';

class EditMyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
         appBar: AppBar(
           title: Text('Nader Nabil'),
           bottom: TabBar(
             tabs: [
               Text('Basic Info',
               style: TextStyle(
                 color: Color(0xff0038A7),
                 fontWeight: FontWeight.bold,
                 fontSize: 14.8.dp
               ),),
               Text('Driver License',
                 style: TextStyle(
                     color: Color(0xff0038A7),
                     fontWeight: FontWeight.bold,
                     fontSize: 14.8.dp
                 ),),
               Text('Insurance',
                 style: TextStyle(
                     color: Color(0xff0038A7),
                     fontWeight: FontWeight.bold,
                     fontSize: 14.8.dp
                 ),),
             ],
           ),
         ),
          body: TabBarView(
              children:[
                BasicInfoScreen(),
                DriverLicenseScreenInEditMyProfile(),
                InsuranceScreenInEditMyProfile(),
              ]
          ),
        )
    );
  }
}
