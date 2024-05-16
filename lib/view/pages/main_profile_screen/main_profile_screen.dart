import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/edit_my_profile_screen_directory/edit_my_profile_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/notifications_screen/notifications_screen.dart';

class MainProfileScreen extends StatelessWidget {
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
                    backgroundColor: Color(0xffECECEC),
                    child: Icon(
                      Icons.person,
                      size: 52.dp,
                      color: Color(0xffA2A2A2),
                    ),
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  Text(
                    'Nader Nabil',
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
                        builder: (context) => EditMyProfileScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
                            NotificationsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Color(0xff808080),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Cashback',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
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
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffA2A2A2),
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
