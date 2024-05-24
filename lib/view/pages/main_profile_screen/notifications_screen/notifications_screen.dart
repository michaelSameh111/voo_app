import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/main_profile_screen.dart';
import 'package:voo_app/view/pages/main_profile_screen/notifications_screen/notification_details.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Widget buildNotificationItem() {
      return Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationDetails()));
            },
            child: Container(
              padding: EdgeInsets.all(7.dp),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffF4F4F4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Ride Request from joshua',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      const Spacer(),
                      Text(
                        '1 h',
                        style: TextStyle(
                            color: const Color(0xff646363),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.dp),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. '
                        'Eget fringilla massa purus vitae.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.dp),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationDetails()));
            },
            child: Container(
              padding: EdgeInsets.all(7.dp),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Josh cancel pre-book ride',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      const Spacer(),
                      Text(
                        '1 h',
                        style: TextStyle(
                            color: const Color(0xff646363),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.dp),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. '
                        'Eget fringilla massa purus vitae.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.dp),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10.h,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainProfileScreen()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.arrow_back)),
            ),
          ),
          title: Text(
            'Notifications',
            style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Container(
                padding: EdgeInsets.all(10.dp),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(13.dp),
                ),
                child: const Text(
                  '2 NEW',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Text(
                      'TODAY',
                      style: TextStyle(
                          color: const Color(0xff808080),
                          fontSize: 15.dp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Mark all as read',
                          style: TextStyle(color: Colors.black, fontSize: 16.dp),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  itemBuilder: (context, index) => buildNotificationItem(),
                  itemCount: 2,
                  shrinkWrap: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Text(
                      'YESTERDAY',
                      style: TextStyle(
                          color: const Color(0xff808080),
                          fontSize: 15.dp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Mark all as read',
                          style: TextStyle(color: Colors.black, fontSize: 16.dp),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  itemBuilder: (context, index) => buildNotificationItem(),
                  itemCount: 1,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

