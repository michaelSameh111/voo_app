import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:voo_app/Model/LoginDataModel.dart';
import 'package:voo_app/Model/VehicleTypeModel.dart';

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

