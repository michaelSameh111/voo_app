import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 10.h,
        leadingWidth: 0,
        title: Row(
          children: [
            SizedBox(
              width: 1.w,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 20.h,
                  width: 10.w,
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
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: Text(
                'Notifications',
                style: TextStyle(
                    fontSize: 24.dp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.5.h),
        //     child: Container(
        //       padding: EdgeInsets.all(10.dp),
        //       decoration: BoxDecoration(
        //         color: Colors.black,
        //         borderRadius: BorderRadius.circular(13.dp),
        //       ),
        //       child: Center(
        //         child: const Text(
        //           '   2 NEW   ',
        //           style: TextStyle(
        //               color: Colors.white, fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: 10.h),
            child: Center(child: Text('No Notifications Yet!',style: TextStyle(fontSize: 24.dp),),),
          )
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 3.w),
          //   child: Row(
          //     children: [
          //       Text(
          //         'TODAY',
          //         style: TextStyle(
          //             color: const Color(0xff808080),
          //             fontSize: 15.dp,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       const Spacer(),
          //       TextButton(
          //           onPressed: () {},
          //           child: Text(
          //             'Mark all as read',
          //             style: TextStyle(color: Colors.black, fontSize: 16.dp),
          //           ))
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 100.h,
          //   child: ListView.builder(
          //     itemBuilder: (context, index) => buildNotificationItem(),
          //     itemCount: 2,
          //     shrinkWrap: true,
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 3.w),
          //   child: Row(
          //     children: [
          //       Text(
          //         'YESTERDAY',
          //         style: TextStyle(
          //             color: const Color(0xff808080),
          //             fontSize: 15.dp,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       const Spacer(),
          //       TextButton(
          //           onPressed: () {},
          //           child: Text(
          //             'Mark all as read',
          //             style: TextStyle(color: Colors.black, fontSize: 16.dp),
          //           ))
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 100.h,
          //   child: ListView.builder(
          //     itemBuilder: (context, index) => buildNotificationItem(),
          //     itemCount: 1,
          //     shrinkWrap: true,
          //   ),
          // ),
        ],
      ),
    );
  }
}

