import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/view/pages/LandingPage.dart';
import 'package:voo_app/view/pages/main_profile_screen/app_settings_screen/app_settings_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/bank_account_screen_edit_profile_screen/bank_account_screen_edit_profile_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/cash_back_screen/cash_back_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/claim_screen/claim_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/earnings_screen/earnings_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen/edit_my_profile_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/help_center/help_center_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/notifications_screen/notifications_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/vehicle_information_screen_edit_profile_screen/vehicle_information_screen_edit_profile_screen.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 5.h, bottom: 4.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10.w,
                    backgroundColor: const Color(0xffECECEC),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        '${loginData.image}',
                        fit: BoxFit.fill,
                        height: 30.h,
                        width: 30.h,
                        errorBuilder: (context,object,skipTrace){
                          return
                          Icon(
                                Icons.person,
                                size: 52.dp,
                                color: const Color(0xffA2A2A2),
                              );
                        },
                      ),
                    ),
                    // child: Icon(
                    //   Icons.person,
                    //   size: 52.dp,
                    //   color: const Color(0xffA2A2A2),
                    // ),
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  Text(
                    '${loginData.firstName} ${loginData.lastName}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.dp),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              color: const Color(0xffECECEC),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditMyProfileScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit_outlined,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Edit My Profile',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppSettingsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'App Settings',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const VehicleInformationScreenEditProfileScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.directions_car,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Vehicle Information',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const BankAccountScreenEditProfileScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.credit_card,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Bank Account',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EarningsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.money_outlined,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Earnings',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ClaimScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.compare_arrows,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Claim',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CashBackScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Cash back',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Landingpage(settings: true,)));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.groups,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Partners',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HelpCenterScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.help_outlined,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Help Center',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xffA2A2A2),
                      size: 17.dp,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
          ],
        ),
      ),
    ));
  }
}
