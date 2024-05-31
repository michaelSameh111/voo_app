import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:voo_app/Model/LoginDataModel.dart';
import 'package:voo_app/Model/TripModel.dart';
import 'package:voo_app/Model/VehicleTypeModel.dart';

import '../Model/EndTripModel.dart';

String? token = '';
String? fcmToken = '';
String? loggedInEmail = '';
String? loggedInPassword = '';
bool rememberMe = false;
TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();
LoginDataModel loginData = LoginDataModel();
VehicleTypesModel  vehicleTypesModel = VehicleTypesModel();
String? socialSecurity ;
String? securityCode ;
String? language ;
const String googleMapApiKey = 'AIzaSyC0vwuoMC2YaegAD6xJEomD0VjNRVXYh60';
Position? sourcePosition;
TripModel tripModel = TripModel();
TripModel? trip ;
bool tripToPickup = false;
bool tripToDestination = false;
EndTripModel endTripModel  = EndTripModel();
DriverData? driverData;
DriverInsurance? insuranceData;
DriverLicense? licenseData;
DriverVehicle? driverVehicle;


void showSimpleDialog(BuildContext context,String title,String desc) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Please Add Insurance Image'),
        content: Text('An insurance image is required to proceed.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
void showSimpleDialogs(BuildContext context,String title,String desc,String? image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title'),
        content: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Text('$desc'),
            SizedBox(height: 2.h,),
            image == null ? SizedBox() : Image.network(image,height: 20.h,width: 100.w,)
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

