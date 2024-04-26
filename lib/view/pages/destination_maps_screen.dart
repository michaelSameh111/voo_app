import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class DestinationMapsScreen extends StatelessWidget {

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
                  'Destination',
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
                        color: Colors.black,
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
                          onPressed: () {},
                          child: Container(
                            child: Text(
                              'Navigate to destination',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
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
