import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../Model/TripsHistoryModel.dart';

class CompletedHistoryWidget extends StatelessWidget {
  const CompletedHistoryWidget({super.key});

  final String name = 'Andrew Micheal';
  final int tripID = 1234567899;
  final String carType = 'Sedan';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
      child: Container(
        padding: EdgeInsets.all(10.dp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(
                color: Color(0xffC4C4C4))
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffA2A2A2),
                  radius: 7.w,
                  child: Icon(Icons.person,
                    size: 32.dp,
                    color: const Color(0xffFEFEFE),),
                ),
                SizedBox(width: 2.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                        fontSize: 15.dp,
                        fontWeight: FontWeight.bold,

                      ),),
                    Row(
                      children: [
                        Text('Trip ID :',
                          style: TextStyle(
                              fontSize: 15.dp,
                              color: const Color(0xff646363)
                          ),),
                        SizedBox(width: 1.w,),
                        Text('$tripID',
                          style: TextStyle(
                              fontSize: 15.dp,
                              color: const Color(0xff646363)
                          ),)
                      ],
                    ),
                    // const Divider(
                    //   color: Color(0xffF5F4F4),
                    // )
                    const Row(
                      children: [

                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('4.5 Mile',
                  style: TextStyle(fontSize: 15.dp),),
                const Spacer(),
                Icon(Icons.access_time,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('4 mins',
                  style: TextStyle(fontSize: 15.dp),),
                const Spacer(),
                Icon(Icons.attach_money,
                  color: const Color(0xffFF6A03),
                  size: 25.dp,
                ),
                SizedBox(width: 1.w,),
                Text('\$1.25',
                  style: TextStyle(fontSize: 15.dp),)
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Text('Date & Time',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500
                  ),),
                const Spacer(),
                Text('Oct 18,2024',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),), //date
                SizedBox(width: 2.w,),
                Container(
                  height: 3.h,
                  width: 0.2.w,
                  color: Colors.black,),
                SizedBox(width: 2.w,),
                Text('08:00 AM',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),), //date
              ],
            ),
            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),

            Row(
              children: [
                Image.asset(
                  'assets/images/from_to_image.png',
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '481 Eighth Avenue, Hell\'s Kitchen,\nNew York, '
                            'NY 10001 , United States',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'The New Yorker, A Wyndham Hotel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      )
                    ],
                  ),
                )
              ],
            ), // same Row as in collect cash screen

            SizedBox(height: 2.h,),
            const Divider(color: Color(0xffF5F4F4),),
            SizedBox(height: 2.h,),

            Row(
              children: [
                Text('Booking car type',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500
                  ),),
                const Spacer(),
                Text('$carType',
                  style: TextStyle(
                      fontSize: 15.dp
                  ),),  //car type
              ],
            ),

          ],
        ),
      ),
    );
  }
}
class CompletedHistoryWidgets extends StatelessWidget {
  final DriverCompletedTrips driverCompletedTrips;
  const CompletedHistoryWidgets({super.key,required this.driverCompletedTrips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
      child: Container(
        padding: EdgeInsets.all(15.dp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(
                color: Color(0xffC4C4C4))
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('${driverCompletedTrips.date} / ${driverCompletedTrips.time}',
                  style: TextStyle(fontSize: 15.dp,color: Colors.black,fontWeight: FontWeight.bold),),
                const Spacer(),
                Text('${driverCompletedTrips.total}',
                  style: TextStyle(fontSize: 15.dp),)
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Image.asset(
                  'assets/images/from_to_image.png',
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${driverCompletedTrips.from}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        '${driverCompletedTrips.to}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class CanceledHistoryWidgets extends StatelessWidget {
  final DriverCancelledTrips driverCancelledTrips;
  const CanceledHistoryWidgets({super.key,required this.driverCancelledTrips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
      child: Container(
        padding: EdgeInsets.all(15.dp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(
                color: Color(0xffC4C4C4))
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('${driverCancelledTrips.acceptedAt}',
                  style: TextStyle(fontSize: 15.dp,color: Colors.black,fontWeight: FontWeight.bold),),
                const Spacer(),
                Text(driverCancelledTrips.total != null ? '${driverCancelledTrips.total}' : '\$0',
                  style: TextStyle(fontSize: 15.dp),)
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              children: [
                Image.asset(
                  'assets/images/from_to_image.png',
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${driverCancelledTrips.pickupTitle}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        '${driverCancelledTrips.destinationTitle}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}