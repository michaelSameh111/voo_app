import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/customer_location_maps_screen.dart';
import 'package:voo_app/view/pages/history_screen.dart';
import 'package:voo_app/view/pages/main_bottom_navigation_bar.dart';
import 'package:voo_app/view/pages/main_profile_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class HomePageMapsScreen extends StatefulWidget {
  @override
  State<HomePageMapsScreen> createState() => _HomePageMapsScreenState();
}

class _HomePageMapsScreenState extends State<HomePageMapsScreen> {
  int currentIndex = 0;
  bool light = true;
  bool showDialogBool = false;

  // List <Widget> screens = [
  //   HomePageMapsScreen(),
  //   MainProfileScreen(),
  //   HistoryScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.w)),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Color(0xffA2A2A2),
                        child: Icon(
                          Icons.person,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        decoration: BoxDecoration(
                            color: Color(0xff0038A7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const Text(
                              'Online',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 2.5.w,
                              child: CircleAvatar(
                                backgroundColor: Color(0xff637eb7),
                                radius: 1.8.w,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff0038A7),
                          radius: 6.w,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 3.5.w,
                            child: Icon(
                              Icons.attach_money,
                              color: Color(0xff0038A7),
                              size: 19.dp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Earnings',
                              style: TextStyle(color: Color(0xff646363)),
                            ),
                            Text(
                              '\$250',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.dp),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff0038A7),
                          radius: 6.w,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 3.5.w,
                            child: Icon(
                              Icons.calendar_today,
                              color: Color(0xff0038A7),
                              size: 18.dp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total trips',
                              style: TextStyle(color: Color(0xff646363)),
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.dp),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              CircleAvatar(
                radius: 18.w,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0.h),
                  child: Column(
                    children: [
                      Icon(
                        Icons.hourglass_top,
                        color: Color(0xff0038A7),
                        size: 30.dp,
                      ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      Text(
                        '30',
                        style: TextStyle(
                            color: Color(0xff0038A7), fontSize: 25.dp),
                      ),
                      Text(
                        'Seconds',
                        style: TextStyle(
                            color: Color(0xff808080), fontSize: 16.dp),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                child: Text('Change location state (for UI)'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => StatefulBuilder(
                    builder: (context, setState) {
                      return Theme(
                        data: ThemeData(
                            dialogBackgroundColor: Colors.white),
                        child: Dialog(
                          elevation: 0,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                height: 28.h,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'You\'re offline',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.dp,
                                          color: Color(0xff646363)),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      'Go online to accept jobs.',
                                      style: TextStyle(
                                          fontSize: 15.dp,
                                          color: Color(0xff646363)),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Switch(
                                        trackOutlineColor:
                                        MaterialStateProperty.all(
                                            Colors.transparent),
                                        activeTrackColor:
                                        const Color(0xff0038A7),
                                        inactiveTrackColor:
                                        Color(0xffD1D1D6),
                                        inactiveThumbColor: Colors.white,
                                        value: light,
                                        onChanged: (bool value) {
                                          setState(() {
                                            light = value;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              Positioned(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 40,
                                  child: Image.asset(
                                    'assets/images/notification_offline.png',
                                    width: 12.w,
                                  ),
                                ),
                                top: -50,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ));
                },
              ),
              SizedBox(
                width: 80.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0038A7)),
                    onPressed: () {
                      if (light == true){
                        acceptDeclineShowModalSheet(context);
                        //&& showDialog closed
                      }
                      else{
                        showDialog(
                          context: context,
                          builder: (context) => StatefulBuilder(
                            builder: (context, setState) {
                              return Theme(
                                data: ThemeData(
                                    dialogBackgroundColor: Colors.white),
                                child: Dialog(
                                  elevation: 0,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        height: 28.h,
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'You\'re offline',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.dp,
                                                  color: Color(0xff646363)),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              'Go online to accept jobs.',
                                              style: TextStyle(
                                                  fontSize: 15.dp,
                                                  color: Color(0xff646363)),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 1.5.h,
                                            ),
                                            Divider(),
                                            SizedBox(
                                              height: 1.5.h,
                                            ),
                                            Switch(
                                                trackOutlineColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                                activeTrackColor:
                                                const Color(0xff0038A7),
                                                inactiveTrackColor:
                                                Color(0xffD1D1D6),
                                                inactiveThumbColor: Colors.white,
                                                value: light,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    light = value;
                                                    showDialogBool = value;

                                                    if(showDialogBool == true){
                                                      Navigator.of(context).pop();
                                                    }

                                                    acceptDeclineShowModalSheet(context);
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 40,
                                          child: Image.asset(
                                            'assets/images/notification_offline.png',
                                            width: 12.w,
                                          ),
                                        ),
                                        top: -50,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }

                    },
                    child: Container(
                      child: Text(
                        'Find Jobs',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff0038A7),
        unselectedItemColor: const Color(0xffA2A2A2),
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

void acceptDeclineShowModalSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23), topRight: Radius.circular((23))),
    ),
    context: context,
    builder: (context) => Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
          child: Row(
            children: [
              Text(
                'Ride Request',
                style: TextStyle(
                  fontSize: 18.dp,
                ),
              ),
              Spacer(),
              Text(
                '5 mins away',
                style: TextStyle(color: Color(0xff808080)),
              )
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 7.0.w,
                    backgroundColor: Color(0xffECECEC),
                    child: Icon(
                      Icons.person,
                      size: 11.w,
                      color: Color(0xffA2A2A2),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Nader Nabil',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Text(
                        'Cash Payment',
                        style: TextStyle(
                            color: Color(0xff808080), fontSize: 13.dp),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/from_to_image.png',
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '481 Eighth Avenue, Hell\'s Kitchen,\nNew York, NY 10001 , United States',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Stack(
                        children: [
                          Positioned(
                              right: -50,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.dp),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 10,
                                          blurRadius: 10,
                                          offset: Offset(0, 7))
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.all(6.dp),
                                  child: Text(
                                    '10 mins trip',
                                    style: TextStyle(color: Color(0xff808080)),
                                  ),
                                ),
                              )),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 50.w),
                            width: 80.w,
                            height: 0.2.h,
                            decoration: BoxDecoration(color: Colors.black
                                //0xffE2E2E2
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      // Divider(
                      //   height: 5.h,
                      //   color: Color(0xffE2E2E2),
                      // ),
                      Text(
                        'The New Yorker, A Wyndham Hotel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      )
                    ],
                  )
                ],
              ), // same Row as in collect cash screen
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 5.5.h,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff0038A7))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageMapsScreen()));
                        },
                        child: Container(
                          child: Text(
                            'Decline',
                            style: TextStyle(color: Color(0xff0038A7)),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 5.5.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0038A7)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CustomerLocationMapsScreen()));
                        },
                        child: Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
