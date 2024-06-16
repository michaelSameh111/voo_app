import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AcceptDeclineWidget extends StatelessWidget {
  final String? pickUp;
  final String? destination;
  final String? rider;
  final String? paymentMethod;
  final String? tripId;
  final double? sourceLatitude;
  final double? sourceLongitude;
  final bool? loadingState;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final String? time;

  const AcceptDeclineWidget({
    Key? key,
    this.pickUp,
    this.destination,
    this.rider,
    this.paymentMethod,
    this.tripId,
    this.sourceLatitude,
    this.sourceLongitude,
    this.loadingState,
    this.onAccept,
    this.onDecline,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
              const Spacer(),
              Text(
                '$time mins away',
                style: TextStyle(color: Color(0xff808080)),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 7.0.w,
                    backgroundColor: const Color(0xffECECEC),
                    child: Icon(
                      Icons.person,
                      size: 11.w,
                      color: const Color(0xffA2A2A2),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$rider',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Text(
                        '$paymentMethod',
                        style: TextStyle(
                            color: const Color(0xff808080), fontSize: 13.dp),
                      ),
                    ],
                  ),
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$pickUp',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                                      offset: const Offset(0, 7),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6.dp),
                                  child: const Text(
                                    '10 mins trip',
                                    style: TextStyle(color: Color(0xff808080)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 50.w),
                              width: 80.w,
                              height: 0.2.h,
                              decoration:
                              const BoxDecoration(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          '$destination',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.dp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 5.5.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xffFF6A03)),
                      ),
                      onPressed: onDecline,
                      child: const Text(
                        'Decline',
                        style: TextStyle(color: Color(0xffFF6A03)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 5.5.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF6A03),
                      ),
                      onPressed: onAccept,
                      child: loadingState == true
                          ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                          : const Text(
                        'Accept',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}