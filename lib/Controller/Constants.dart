import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
bool declineBottomSheet = false;
bool? light;
bool tripToDestination = false;
EndTripModel endTripModel  = EndTripModel();
DriverData? driverData;
DriverInsurance? insuranceData;
DriverLicense? licenseData;
DriverVehicle? driverVehicle;
TripsHisotryModel? tripsHisotryModel;
final player = AudioPlayer();
List<LatLng> polyLineCoordinates = [];
List<String> states = [
  "Please Select State"
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "District of Columbia",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming",
];
String? availableToCheck;

const String FAIRMATIC_CHANNEL = "fairmatic_channel";
class NoSpacesOrDotsInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    String newText = newValue.text.replaceAll(RegExp(r'[ .]'), '');

    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }}
class LettersAndDigitsInputFormatter extends TextInputFormatter {
@override
TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
  // Allow only letters and digits
  String newText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

  return TextEditingValue(
    text: newText,
    selection: newValue.selection.copyWith(
      baseOffset: newText.length,
      extentOffset: newText.length,
    ),
  );
}
}
void showSimpleDialog(BuildContext context,String title,String desc) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title == 'title' ? 'Please Add Insurance Image' : title),
        content: Text(desc == 'desc' ? 'An insurance image is required to proceed.' : desc),
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
void showRichTextDialog(BuildContext context,String title,String desc) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title == 'title' ? 'Please Add Insurance Image' : title),
        content: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:'You have completed your 12-hour shift, so please take a mandatory 6-hour break \nyou have ',
                style: GoogleFonts.roboto(color: Colors.black,fontSize: 16.dp)
              ),
              TextSpan(
                text:'$desc',
                style: GoogleFonts.roboto(fontSize: 16.dp,color: Color(0xffFF6A03),fontWeight: FontWeight.bold)
              ),
              TextSpan(
                text:' left in your break',
                  style: GoogleFonts.roboto(color: Colors.black,fontSize: 16.dp)
              ),
            ]
          ),
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
void makePhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

