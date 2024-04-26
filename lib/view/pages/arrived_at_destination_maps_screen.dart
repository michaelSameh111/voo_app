import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class ArrivedAtDestinationMapsScreen extends StatelessWidget {
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
                  onPressed: (){
                    arrivedAtDestinationShowModalSheet(context);
                  },
                  child: Text(
                    'Finish the trip'
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

void arrivedAtDestinationShowModalSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23),
          topRight: Radius.circular((23))),
    ),
    context: context,
    builder: (context) => SizedBox(
      height: 50.h,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 7.h,),
          Image(image: AssetImage('assets/images/enable_location_access_image.png'),
          ),
          SizedBox(height: 2.h),
          Text('Arrived at Customer Location',
            style: TextStyle(color: Color(0xff0038A7),fontSize: 20.dp,fontWeight: FontWeight.bold),),
          SizedBox(height: 1.5.h,),
          Text('6358 Elign St. Celina, Delaware....',
          style: TextStyle(color: Color(0xff1D1B1B),fontSize: 15.dp),),
          SizedBox(height: 4.h,),
          MainElevatedButton(
              nextScreen: ArrivedAtDestinationMapsScreen(),
              text: 'Done',
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
    ),
  );
}
