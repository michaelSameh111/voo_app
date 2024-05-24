import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/main_profile_screen/vehicle_information_screen_edit_profile_screen/add_new_car_screen.dart';

class VehicleInformationScreenEditProfileScreen extends StatelessWidget {
  const VehicleInformationScreenEditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
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
          'Vehicle Information',
          style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.dp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15.dp),
                border: Border.all(color: const Color(0xffC4C4C4)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.network('https://www.pexels.com/photo'
                      //     '/black-jeep-suv-on-black-asphalt-road-near'
                      //     '-on-snowy-grass-lawn-104401/',width: 15.w,height: 15.h,)  54555554
                      Image(
                        width: 20.w,
                        height: 20.h,
                        image: const AssetImage(
                          'assets/images/background_location_image.png',
                        ),
                      ),
                      SizedBox(width: 6.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),

                            decoration:
                            BoxDecoration(color: const Color(0xfffceaea),
                            borderRadius: BorderRadius.circular(15.dp)),
                          child: const Text('Under Verification',),
                          ),
                          Text('Sedan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.dp
                          ),),
                          Text('Type',
                            style: TextStyle(
                            color: const Color(0xff646363),
                                fontSize: 15.dp
                            ),),
                          Text('Last update 6 jun 2022',
                            style: TextStyle(
                                color: const Color(0xff646363),
                                fontSize: 13.dp
                            ),)

                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 5.5.h,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xffFF6A03))),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => RegisterNowScreen()));
                            },
                            child: const Text(
                              'Edit',
                              style: TextStyle(color: Color(0xffFF6A03)),
                            )),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 40.w,
                        height: 5.5.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFF6A03)),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => nextScreen));
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.5.h,),
            SizedBox(
              width: double.infinity,
              height: 5.5.h,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xffFF6A03))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewCarScreen()));
                  },
                  child: const Text(
                    'Add a New Car',
                    style: TextStyle(color: Color(0xffFF6A03)),
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
