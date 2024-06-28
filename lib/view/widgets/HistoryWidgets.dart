import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Model/InProgressTripModel.dart';
import '../../Model/TripsHistoryModel.dart';

class CompletedHistoryWidget extends StatelessWidget {
 final DriverCompletedTrips driverCompletedTrips ;
  const CompletedHistoryWidget({super.key,required this.driverCompletedTrips});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
       leadingWidth: 0,
        toolbarHeight: 10.h,
        // leading: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        //   child: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Container(
        //         decoration: BoxDecoration(
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey.withOpacity(0.5),
        //               spreadRadius: 1,
        //               blurRadius: 1,
        //             )
        //           ],
        //           shape: BoxShape.circle,
        //           color: Colors.white,
        //         ),
        //         child: const Icon(Icons.arrow_back,color: Colors.black,)),
        //   ),
        // ),

        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History',
              style: TextStyle(
                  fontSize: 20.dp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Divider(color: Colors.black,)
          ],
        ),

      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffA2A2A2),
                  radius: 7.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: driverCompletedTrips.riderPhoto != null
                        ? Image.network(
                      driverCompletedTrips.riderPhoto!,
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          size: 32.dp,
                          color: const Color(0xffFEFEFE),
                        );
                      },
                    )
                        :  Center(
                      child: Icon(
                        Icons.person,
                        size: 32.dp,
                        color: const Color(0xffFEFEFE),)
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverCompletedTrips.riderName!,
                      style: TextStyle(
                        fontSize: 15.dp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Trip ID :',
                          style: TextStyle(
                              fontSize: 15.dp, color: const Color(0xff646363)),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          '${driverCompletedTrips.id}',
                          style: TextStyle(
                              fontSize: 15.dp, color: const Color(0xff646363)),
                        )
                      ],
                    ),
                    // const Divider(
                    //   color: Color(0xffF5F4F4),
                    // )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Visibility(
              visible: driverCompletedTrips.driverTotal != null,
              child:
              Row(children: [
                Text('Driver Total'),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  '\$${driverCompletedTrips.driverTotal}',
                  style: TextStyle(fontSize: 15.dp),
                ),
              ],),
            ),
            SizedBox(
              height: 2.h,
            ),

          Row(
              children: [
                Visibility(
                  visible: driverCompletedTrips.distance != null,
                  child: Row(children: [  Icon(
                    Icons.location_on_outlined,
                    color: const Color(0xffFF6A03),
                    size: 25.dp,
                  ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '${driverCompletedTrips.distance} Mile',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),                  ],),
                ),
                Visibility(
                  visible: driverCompletedTrips.duration != null,
                  child: Row(children: [
                    Icon(
                      Icons.access_time,
                      color: const Color(0xffFF6A03),
                      size: 25.dp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '${driverCompletedTrips.duration} mins',
                      style: TextStyle(fontSize: 15.dp),
                    ),

                  ],),
                ),
                Visibility(visible: driverCompletedTrips.duration != null,child: const Spacer()),


              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Text(
                  'Date & Time',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  '${driverCompletedTrips.date}',
                  style: TextStyle(fontSize: 15.dp),
                ), //date
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  height: 3.h,
                  width: 0.2.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  ' ${driverCompletedTrips.time}',
                  style: TextStyle(fontSize: 15.dp),
                ), //date
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            SizedBox(
              height: 2.h,
            ),
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
                        '${driverCompletedTrips.from}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),

                      SizedBox(
                        height: 2.h,
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
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            SizedBox(
              height: 2.h,
            ),
            Visibility(
              visible: driverCompletedTrips.carType != null,
              child: Row(
                children: [
                  Text(
                    'Booking car type',
                    style: TextStyle(
                        color: const Color(0xff808080),
                        fontSize: 15.dp,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    '${driverCompletedTrips.carType}',
                    style: TextStyle(fontSize: 15.dp),
                  ), //car type
                ],
              ),
            ),
            // Spacer(),
            // MainElevatedButtonTwo(
            //   onPressed: () async {
            //     final url = Uri.parse(
            //           driverCompletedTrips.invoice!);
            //     if (await canLaunchUrl(url)) {
            //       await launchUrl(url, mode: LaunchMode.externalApplication);
            //     }
            //   },
            //   text: 'Invoice',
            //   backgroundColor: Color(0xffFF6A03),
            //   circularBorder: true,
            // ),
            // SizedBox(
            //   height: 5.h,
            // )
          ],
        ),
      ),
    );
  }
}
class CanceledHistoryWidget extends StatelessWidget {
 final DriverCancelledTrips driverCancelledTrips ;
  const CanceledHistoryWidget({super.key,required this.driverCancelledTrips});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 0,
        toolbarHeight: 10.h,
        // leading: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        //   child: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Container(
        //         decoration: BoxDecoration(
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey.withOpacity(0.5),
        //               spreadRadius: 1,
        //               blurRadius: 1,
        //             )
        //           ],
        //           shape: BoxShape.circle,
        //           color: Colors.white,
        //         ),
        //         child: const Icon(Icons.arrow_back,color: Colors.black,)),
        //   ),
        // ),

        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History',
              style: TextStyle(
                  fontSize: 20.dp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Divider(color: Colors.black,)
          ],
        ),

      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffA2A2A2),
                  radius: 7.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: driverCancelledTrips.riderPhoto != null
                        ? Image.network(
                      driverCancelledTrips.riderPhoto!,
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          size: 32.dp,
                          color: const Color(0xffFEFEFE),
                        );
                      },
                    )
                        :  Center(
                      child: Icon(
                        Icons.person,
                        size: 32.dp,
                        color: const Color(0xffFEFEFE),)
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${driverCancelledTrips.riderName}',
                      style: TextStyle(
                        fontSize: 15.dp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Trip ID :',
                          style: TextStyle(
                              fontSize: 15.dp, color: const Color(0xff646363)),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          '${driverCancelledTrips.id}',
                          style: TextStyle(
                              fontSize: 15.dp, color: const Color(0xff646363)),
                        )
                      ],
                    ),
                    // const Divider(
                    //   color: Color(0xffF5F4F4),
                    // )
                  ],
                )
              ],
            ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Row(children: [
            //   Text('Status : ',style: TextStyle(color: const Color(0xff808080),fontSize: 24.dp,fontWeight: FontWeight.bold),),
            //   SizedBox(width: 1.w,),
            //   Text('${driverCancelledTrips.status}',style: TextStyle(color: Colors.red,fontSize: 24.dp,fontWeight: FontWeight.bold),),
            // ],),
            Visibility(
              visible: driverCancelledTrips.canceledBy != null && driverCancelledTrips.canceledBy!.isNotEmpty,
              child: Row(children: [
                Text('Canceled By : ',style: TextStyle(color: const Color(0xff808080),fontSize: 16.dp,fontWeight: FontWeight.bold),),
                SizedBox(width: 1.w,),
                Text('${driverCancelledTrips.canceledBy}',style: TextStyle(color: Colors.red,fontSize: 16.dp,fontWeight: FontWeight.bold),),
              ],),
            ),
            SizedBox(height: 1.h,),
            Visibility(
              visible: driverCancelledTrips.cancellationReason != null && driverCancelledTrips.cancellationReason!.isNotEmpty,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text('Status : ',style: TextStyle(color: const Color(0xff808080),fontSize: 12.dp,fontWeight: FontWeight.bold),),
                SizedBox(width: 1.w,),
                Expanded(child: Text('${driverCancelledTrips.cancellationReason}',style: TextStyle(color: Colors.black,fontSize: 12.dp,fontWeight: FontWeight.bold),)),
              ],),
            ),
            Visibility( visible: driverCancelledTrips.canceledBy != null && driverCancelledTrips.canceledBy!.isNotEmpty,child: SizedBox(height: 2.h,)),
            Visibility(
              visible: driverCancelledTrips.driverTotal != null,
              child:
              Row(children: [
                Text('Driver Total'),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  '\$${driverCancelledTrips.driverTotal}',
                  style: TextStyle(fontSize: 15.dp),
                ),
              ],),
            ),
            Visibility(
              visible: driverCancelledTrips.cancellationReason != null && driverCancelledTrips.cancellationReason!.isNotEmpty,
              child: SizedBox(
                height: 2.h,
              ),
            ),
          Row(
              children: [
                Visibility(
                  visible: driverCancelledTrips.distance != null,
                  child: Row(children: [  Icon(
                    Icons.location_on_outlined,
                    color: const Color(0xffFF6A03),
                    size: 25.dp,
                  ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '${driverCancelledTrips.distance} Mile',
                      style: TextStyle(fontSize: 15.dp),
                    ),
                    const Spacer(),                  ],),
                ),
                Visibility(
                  visible: driverCancelledTrips.duration != null,
                  child: Row(children: [
                    Icon(
                      Icons.access_time,
                      color: const Color(0xffFF6A03),
                      size: 25.dp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '${driverCancelledTrips.duration} mins',
                      style: TextStyle(fontSize: 15.dp),
                    ),

                  ],),
                ),
                Visibility(visible: driverCancelledTrips.duration != null,child: const Spacer()),


              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Text(
                  'Date & Time',
                  style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  '${driverCancelledTrips.date}',
                  style: TextStyle(fontSize: 15.dp),
                ), //date
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  height: 3.h,
                  width: 0.2.w,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  ' ${driverCancelledTrips.time}',
                  style: TextStyle(fontSize: 15.dp),
                ), //date
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            SizedBox(
              height: 2.h,
            ),
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
                        '${driverCancelledTrips.from}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '${driverCancelledTrips.to}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.dp),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              color: Color(0xffF5F4F4),
            ),
            SizedBox(
              height: 2.h,
            ),
            Visibility(
              visible: driverCancelledTrips.carType != null,
              child: Row(
                children: [
                  Text(
                    'Booking car type',
                    style: TextStyle(
                        color: const Color(0xff808080),
                        fontSize: 15.dp,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    '${driverCancelledTrips.carType}',
                    style: TextStyle(fontSize: 15.dp),
                  ), //car type
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
class CompletedHistoryWidgets extends StatelessWidget {
  final DriverCompletedTrips driverCompletedTrips;
  const CompletedHistoryWidgets(
      {super.key, required this.driverCompletedTrips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
      child: Container(
        padding: EdgeInsets.all(15.dp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(color: Color(0xffC4C4C4))),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Text('Status :',style: TextStyle(color: const Color(0xff808080),fontSize: 24.dp,fontWeight: FontWeight.bold),),
            //     SizedBox(width: 1.w,),
            //     Text('Completed',style: TextStyle(color:Colors.green,fontSize: 24.dp,fontWeight: FontWeight.bold),),
            //   ],
            // ),
            // SizedBox(height: 1.h,),
            Row(
              children: [
                Text(
                  '${driverCompletedTrips.date} / ${driverCompletedTrips.time}',
                  style: TextStyle(
                      fontSize: 15.dp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '\$${driverCompletedTrips.driverTotal}',
                  style: TextStyle(fontSize: 15.dp),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
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
class InProgressWidget extends StatelessWidget {
  final DriverInProgressTrip driverInProgressTrip;
  const InProgressWidget(
      {super.key, required this.driverInProgressTrip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
      child: Container(
        padding: EdgeInsets.all(15.dp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(color: Color(0xffC4C4C4))),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${driverInProgressTrip.acceptedAt}',
                  style: TextStyle(
                      fontSize: 15.dp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Visibility(
                  visible: driverInProgressTrip.total != null,
                  child: Text(
                    '${driverInProgressTrip.total}',
                    style: TextStyle(fontSize: 15.dp),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
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
                        '${driverInProgressTrip.pickupTitle}',
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
                      Text( driverInProgressTrip.destinationTitle != null?
                        '${driverInProgressTrip.destinationTitle}' : "No Specified Location",
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
  const CanceledHistoryWidgets({super.key, required this.driverCancelledTrips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
      child: Container(
        padding: EdgeInsets.all(15.dp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(color: Color(0xffC4C4C4))),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${driverCancelledTrips.acceptedAt}',
                  style: TextStyle(
                      fontSize: 15.dp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  driverCancelledTrips.total != null
                      ? '${driverCancelledTrips.total}'
                      : '\$0',
                  style: TextStyle(fontSize: 15.dp),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
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
                        '${driverCancelledTrips.from}',
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
                        '${driverCancelledTrips.to}',
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
