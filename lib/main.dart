import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/add_your_photo_screen.dart';
import 'package:voo_app/view/pages/arrived_at_destination_maps_screen.dart';
import 'package:voo_app/view/pages/bank_account_details.dart';
import 'package:voo_app/view/pages/choose_your_language_screen.dart';
import 'package:voo_app/view/pages/customer_location_maps_screen.dart';
import 'package:voo_app/view/pages/driver_license.dart';
import 'package:voo_app/view/pages/edit_my_profile_screen_directory/basic_info.dart';
import 'package:voo_app/view/pages/enable_location_access_screen.dart';
// import 'package:voo_app/view/pages/edit_my_profile_screen/basic_info.dart';
import 'package:voo_app/view/pages/insurance_screen.dart';
import 'package:voo_app/view/pages/location_screen.dart';
import 'package:voo_app/view/pages/login_register_screen.dart';
import 'package:voo_app/view/pages/login_screen.dart';
import 'package:voo_app/view/pages/main_bottom_navigation_bar.dart';
import 'package:voo_app/view/pages/main_profile_screen.dart';
import 'package:voo_app/view/pages/rate_rider_screen.dart';
import 'package:voo_app/view/pages/register_now_screen.dart';
import 'package:voo_app/view/pages/select_transport_screen.dart';
import 'package:voo_app/view/pages/social_security_screen.dart';
import 'package:voo_app/view/pages/vehicle_registration_screen.dart';
import 'package:voo_app/view/pages/we_will_review_screen.dart';
import 'package:voo_app/view/pages/check_info_screen.dart';
import 'package:voo_app/view/pages/get_your_code_screen.dart';
import 'package:voo_app/view/pages/splash_screen.dart';
import 'package:voo_app/view/pages/splash_screen.dart';
import 'view/pages/background_location_screen.dart';
// import 'view/pages/edit_my_profile_screen/edit_my_profile_screen.dart';
import 'view/pages/edit_my_profile_screen_directory/edit_my_profile_screen.dart';
import 'view/pages/home_page_maps_screen.dart';
// import 'view/pages/profile_screens/edit_my_profile_screen_directory.dart';
import 'view/pages/your_safety_come_first_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MaterialApp(
          //theme: ThemeData(useMaterial3: true),
          home: EnableLocationAccessScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
