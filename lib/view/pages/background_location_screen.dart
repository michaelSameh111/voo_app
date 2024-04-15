import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/enable_location_access_screen.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class BackgroundLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Background Location',
                      style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0038A7)),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'We need to access your location.',
                    style: TextStyle(fontSize: 15.dp),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text('Please note that VOO application utilizes location '
                      'services to enhance your experience. '
                      'The app collects background location data for'
                      ' specific features even when the app is not in use,'
                      ' such as during the following scenarios:'),
                  Center(
                      child: Image(
                          image: AssetImage(
                              'assets/images/background_location_image.png'))),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    'When the app is closed:',
                    style: TextStyle(
                        fontSize: 20.dp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text('1. Background location is obtained when the driver is'
                      ' on route to your location.\n '
                      '2. Background location is accessed when the driver '
                      'initiates the ride.'),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Features that use location in the background:',
                    style: TextStyle(
                        fontSize: 20.dp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    '1. Driver Navigation:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  Text('Background location is utilized to guide the driver'
                      ' to your location seamlessly.'),
                  Text(
                    '2. Ride Start:',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                  Text('Background location is employed when the driver '
                      'begins the ride for accurate tracking.'),
                  Row(
                    children: [
                      TextButton(onPressed: (){},
                          child: Text('No, Thanks',
                            style: TextStyle(color: Colors.red),)),
                      Spacer(),
                      TextButton(onPressed: (){},
                          child: Text('Accept',
                            style: TextStyle(color: Color(0xff0038A7)),)),
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Center(
                    child: MainElevatedButton(nextScreen: EnableLocationAccessScreen(),
                        text: 'Next',
                        backgroundColor: Color(0xff0038A7)),
                  ),
                  SizedBox(height: 3.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
