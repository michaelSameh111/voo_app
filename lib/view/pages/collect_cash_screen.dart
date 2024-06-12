import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/view/pages/HomePage/Home.dart';
//ignore_for_file: must_be_immutable
class CollectCashScreen extends StatelessWidget {

  String? destinationLocation;
   CollectCashScreen({super.key,this.destinationLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 4.h),
                child: Text(
                  'Collect Cash',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.dp),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                padding: EdgeInsets.all(40.dp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.dp),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 7,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: const Image(
                    image: AssetImage(
                        'assets/images/collect_cash_wallet_image.png')),
              ),
              SizedBox(height: 2.h,),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),),
                  onPressed: (){},
                  child: Text('Trip Summary',
                    style: TextStyle(
                      color: const Color(0xffFF6A03),
                      fontSize: 23.dp
                    ),)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.h),
                child: Row(
                  children: [
                    Image.asset('assets/images/from_to_image.png',),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${endTripModel.pickup}',
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
                                        boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 10,
                                            blurRadius: 10,
                                            offset: const Offset(0,7)
                                        )]
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(6.dp),
                                      child: const Text(
                                        '10 mins trip'
                                        ,style: TextStyle(color: Color(0xff808080)),
                                      ),
                                    ),
                                  )),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 50.w),
                                width: 80.w,
                                height: 0.2.h,
                                decoration: const BoxDecoration(
                                    color: Colors.black
                                  //0xffE2E2E2
                                ),),
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
                            '${destinationLocation}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.dp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
              thickness: 1.h,
                color: const Color(0xffECECEC),
              ),
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
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${tripModel.rider}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.dp),
                            ),
                            Text(
                              '${tripModel.paymentMethod}',
                              style: TextStyle(
                                  color: const Color(0xff808080), fontSize: 13.dp),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.dp),
                          color: const Color(0xffFF6A03)
                      ),
                      child: Row(
                        children: [
                          Text('Total Amount',
                            style: TextStyle(color: Colors.white,
                                fontSize: 16.dp),),
                          const Spacer(),
                          Text('\$${endTripModel.total}',
                            style: TextStyle(color: Colors.white,
                                fontSize: 16.dp),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.dp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 15,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 80.w,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF6A03)),
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg:
                              'Thank You!',
                              fontSize: 16.dp,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              gravity: ToastGravity.TOP);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePageMapsScreen()));
                        },
                        child: const Text(
                          'Back To Home',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
