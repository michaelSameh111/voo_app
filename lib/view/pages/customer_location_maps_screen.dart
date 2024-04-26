import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/arrived_at_destination_maps_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class CustomerLocationMapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 7.h),
                child: Text(
                  'Customer Location',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.dp),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 9.w,
                    height: 5.h,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.dp)),
                      child: Icon(
                        Icons.my_location,size: 25.dp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w,)
                ],
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Container(
                  padding: EdgeInsets.all(15.dp),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 15,
                          blurRadius: 15,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.dp)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xff0038A7),
                        size: 28.dp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '6358 Elign St. Celina, Delaware\n12564',
                        style: TextStyle(fontSize: 15.dp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.dp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 15,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff0038A7)),
                          onPressed: () {
                            arrivedToPickupShowModalSheet(context);
                          },
                          child: Container(
                            child: Text(
                              'Arrived to pickup location',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Cancel trip',
                          style: TextStyle(
                              color: Color(0xff646363), fontSize: 15.dp),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void arrivedToPickupShowModalSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23),
          topRight: Radius.circular((23))),
    ),
    context: context,
    builder: (context) => SizedBox(
      height: 40.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
            child: Row(
              children: [
                Text(
                  'Customer location',
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
                    Row(
                      children: [
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
                        ),
                        SizedBox(width: 30.w,),
                        InkWell(
                          onTap: (){},
                          child: Container(padding: EdgeInsets.all(5.dp),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.dp),
                            color: Color(0xffD9D9D9)),
                            child: Icon(Icons.phone, color: Colors.red,size: 22.dp),
                          ),
                        ),
                        SizedBox(width: 3.w,),
                        InkWell(
                          onTap: (){},
                          child: Container(padding: EdgeInsets.all(5.dp),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.dp),
                                color: Color(0xffD9D9D9)),
                            child: Icon(Icons.message, color: Colors.red,size: 22.dp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                MainElevatedButton(
                    nextScreen: ArrivedAtDestinationMapsScreen(),
                    text: 'Start trip',
                    backgroundColor: Color(0xff0038A7)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel trip',
                      style: TextStyle(
                          color: Color(0xff646363), fontSize: 15.dp),
                    ))
              ],
            ),
          )
        ],
      ),
    ),
  );
}
