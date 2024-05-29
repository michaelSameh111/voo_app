import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/collect_cash_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ArrivedAtDestinationMapsScreen extends StatefulWidget {
  const ArrivedAtDestinationMapsScreen({super.key});

  @override
  State<ArrivedAtDestinationMapsScreen> createState() =>
      _ArrivedAtDestinationMapsScreenState();
}

class _ArrivedAtDestinationMapsScreenState
    extends State<ArrivedAtDestinationMapsScreen> {
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;
  bool? isChecked5 = false;

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
                  'Arrived at destination',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.dp),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    arrivedAtDestinationShowModalSheet(context);
                  },
                  child: const Text('Finish the trip'))
            ],
          ),
        ),
      ),
    );
  }

  void arrivedAtDestinationShowModalSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23), topRight: Radius.circular((23))),
      ),
      context: context,
      builder: (context) => SizedBox(
        height: 80.h,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            const Image(
              image:
                  AssetImage('assets/images/enable_location_access_image.png'),
            ),
            SizedBox(height: 1.h),
            Text(
              'Arrived at Customer Location',
              style: TextStyle(
                  color: const Color(0xff0038A7),
                  fontSize: 20.dp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              '6358 Elign St. Celina, Delaware....',
              style: TextStyle(color: const Color(0xff1D1B1B), fontSize: 15.dp),
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              width: 80.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0038A7)),
                  onPressed: () {
                    arrivedAtDestinationShowModalSheet(context);
                  },
                  child: const Text(
                    'Arrived to pickup location',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 1.h,
            ),
            MainElevatedButton(
                // el button da kan mawgood f screen tanya makan el done button eli fo2eeh
                nextScreen:  CollectCashScreen(),
                text: 'End trip',
                backgroundColor: const Color(0xff0038A7)),
            TextButton(
                onPressed: () {
                  cancelTripShowModalSheet(context);
                },
                child: Text(
                  'Cancel trip',
                  style: TextStyle(color: const Color(0xff646363), fontSize: 15.dp),
                ))
          ],
        ),
      ),
    );
  }

  void cancelTripShowModalSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23), topRight: Radius.circular((23))),
      ),
      context: context,
      builder: (context) => SizedBox(
        height: 27.h,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                children: [
                  Text(
                    'Are you sure you want to cancel ?',
                    style:
                        TextStyle(fontSize: 15.dp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          tellUsWhyShowModalSheet(context);
                        },
                        child: const Text(
                          'Yes, Cancel',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    height: 5.5.h,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xff646363))),
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ArrivedAtDestinationMapsScreen()));
                        },
                        child: const Text(
                          'No, Keep ride',
                          style: TextStyle(color: Color(0xff646363)),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void tellUsWhyShowModalSheet (BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23), topRight: Radius.circular((23))),
        ),
        context: context,
        builder: (context) => SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Tell us why want to cancel',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.dp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                          activeColor: Colors.red,
                                          shape: const CircleBorder(),
                                          value: isChecked1,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked1 = value;
                                            });
                                          }),
                                    ),
                                    Text(
                                      'Ride not available',
                                      style: TextStyle(fontSize: 16.dp),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 0.2.h,
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                          activeColor: Colors.red,
                                          shape: const CircleBorder(),
                                          value: isChecked2,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked2 = value;
                                            });
                                          }),
                                    ),
                                    Text(
                                      'Rider want to book another captain',
                                      style: TextStyle(fontSize: 16.dp),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 0.2.h,
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                          activeColor: Colors.red,
                                          shape: const CircleBorder(),
                                          value: isChecked3,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked3 = value;
                                            });
                                          }),
                                    ),
                                    Text(
                                      'Ride not available',
                                      style: TextStyle(fontSize: 16.dp),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 0.2.h,
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                          activeColor: Colors.red,
                                          shape: const CircleBorder(),
                                          value: isChecked4,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked4 = value;
                                            });
                                          }),
                                    ),
                                    Text(
                                      'Rider want to book another captain',
                                      style: TextStyle(fontSize: 16.dp),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 0.2.h,
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                          activeColor: Colors.red,
                                          shape: const CircleBorder(),
                                          value: isChecked5,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked5 = value;
                                            });
                                          }),
                                    ),
                                    Text(
                                      'Other',
                                      style: TextStyle(fontSize: 16.dp),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.0.w, vertical: 1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 43.w,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            onPressed: () {
                                              bookingCancelledSuccessfullyModalSheet(
                                                  context);
                                            },
                                            child: const Text(
                                              'Submit',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      SizedBox(
                                        width: 43.w,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                                side: const BorderSide(color: Colors.red)),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ArrivedAtDestinationMapsScreen()));
                                            },
                                            child: const Text(
                                              'Keep ride',
                                              style: TextStyle(color: Colors.red),
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  void bookingCancelledSuccessfullyModalSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23), topRight: Radius.circular((23))),
      ),
      context: context,
      builder: (context) => SizedBox(
        height: 40.h,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 6.h,),
            Icon(
              Icons.cancel_rounded,
               size: 55.dp,
            color: Colors.red),
            SizedBox(height: 4.h,),
            Text('Booking Canceled Successfully',
              style:
              TextStyle(fontWeight: FontWeight.bold,
              fontSize: 18.dp),),
            SizedBox(height: 1.h,),
            Text('Your booking with CRN : #854HG23 has',
              style: TextStyle(color: const Color(0xff646363),
              fontSize: 14.dp),),
            Text('been canceled successfully',
              style: TextStyle(color: const Color(0xff646363),
                  fontSize: 14.dp),),
            SizedBox(height: 2.h,),
            MainElevatedButton(
                nextScreen: const ArrivedAtDestinationMapsScreen(),
                text: 'Got it',
                backgroundColor: Colors.red)

          ],
        ),
      ),
    );
  }
}
