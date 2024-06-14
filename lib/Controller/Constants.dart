import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voo_app/Model/InProgressTripModel.dart';
import 'package:voo_app/Model/LoginDataModel.dart';
import 'package:voo_app/Model/TripModel.dart';
import 'package:voo_app/Model/TripsHistoryModel.dart';
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
InProgressTripModel  inProgressTrip = InProgressTripModel();
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
TripsHisotryModel? tripsHisotryModel;

const String FAIRMATIC_CHANNEL = "fairmatic_channel";

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
Future<void> launchWhatsAppChat(String phoneNumber) async {
  if (!await canLaunchUrl(Uri.parse('whatsapp://send?phone=$phoneNumber'))) {
    throw 'Could not launch WhatsApp';
  }
  await launchUrl(Uri.parse('whatsapp://send?phone=$phoneNumber'));
}
Future<void> launchRouting(String lat , String lng) async {
  if (!await canLaunchUrl(Uri.parse('google.navigation:q=${lat}, ${lng}&key=${googleMapApiKey}'))) {
    throw 'Could not launch WhatsApp';
  }
  await launchUrl(Uri.parse('google.navigation:q=${lat}, ${lng}&key=${googleMapApiKey}'));
}
// Future<void> launchRoutings(String lat , String lng) async {
//   if (!await canLaunchUrl(Uri.parse('https://www.google.com/maps/dir/?api=1&travelmode=driving&dir_action=navigate&origin=${sourcePosition!.latitude},${sourcePosition!.longitude}&destination=34.0522,-118.2437'))) {
//     throw 'Could not launch WhatsApp';
//   }
//   await launchUrl(Uri.parse('https://www.google.com/maps/dir/?api=1&travelmode=driving&dir_action=navigate&origin=${sourcePosition!.latitude},${sourcePosition!.longitude}&destination=34.0522,-118.2437'));
// }
void makePhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

