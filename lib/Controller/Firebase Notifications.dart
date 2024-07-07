import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:voo_app/Controller/Constants.dart';
import '../Model/TripModel.dart';
import '../Model/TripRequestModel.dart';
import '../main.dart';
import '../view/widgets/CountDownDialog.dart';
import 'Data/data_cubit.dart';
import 'Functions.dart';

class FirebaseNotifications {

  final _firebaseMessaging = FirebaseMessaging.instance;
  bool _isNotificationClickHandled = false;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    fcmToken = token;
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    print(fcmToken);
  }

  void handleMessage(RemoteMessage? message) {
    if (message != null && message.notification != null && message.notification!.title == 'New Trip request') {
      // Handle foreground notification logic here
    }
    if (message == null) return;
    else {
      print(message.data);
    }
  }

  Future<void> handleNotificationClick(RemoteMessage message) async {
    if (_isNotificationClickHandled) return;

    _isNotificationClickHandled = true;

    print('Handling a notification click: ${message.messageId}');
    if (message.data['message'] == 'Send Request Trip') {
      try {
        newTripNotification = TripModel.fromJson(message.data);
      } catch (error) {
        print("Error parsing trip data: $error");
      }
      if (newTripNotification != null) {
        tripModel = newTripNotification!;
        trip ??= newTripNotification;
      }
      print(message.notification?.body);
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (tripModel.pickupLongitude == null || tripModel.pickupLatitude == null) {
        // Handle error or missing data
      } else {
        getEstimatedTime(
          driverLat: sourcePosition!.latitude,
          driverLng: sourcePosition!.longitude,
          riderLat: double.parse(tripModel.pickupLatitude!),
          riderLng: double.parse(tripModel.pickupLongitude!),
          apiKey: googleMapApiKey,
        ).then((value) async {
          if (value != null) {
            DataCubit.time = value;
          }
          print(DataCubit.time);
          final x = await getAddressFromLatLng(
              double.parse(tripModel.pickupLatitude!),
              double.parse(tripModel.pickupLongitude!));
          final y;
          if (tripModel.destinationLatitude != null) {
            y = await getAddressFromLatLng(
                double.parse(tripModel.destinationLatitude!),
                double.parse(tripModel.destinationLongitude!));
          } else {
            y = 'Not Specified';
          }

          // Ensure the context is available and correct
          final currentContext = navigatorKey.currentContext;
          if (currentContext != null) {
            showDialog(
              context: currentContext,
              builder: (BuildContext context) {
                return CountdownDialog(
                  onTimerFinish: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                );
              },
            );
            acceptDeclineShowModalSheet(currentContext, x, y);

          }
        });
      }
    } else
    if (message.data['message'] == 'Send Request Trip less Price') {
      TripRequest tripRequest;
      tripRequest = TripRequest.fromJson(message.data);
      getEstimatedTime(driverLat: sourcePosition!.latitude, driverLng: sourcePosition!.longitude, riderLat: double.parse(tripRequest.pickupLatitude), riderLng: double.parse(tripRequest.pickupLongitude), apiKey: googleMapApiKey).then((value){
        DataCubit.time = value!;
        print(value);
      });
      final currentContext = navigatorKey.currentContext;
      if(currentContext != null){acceptDeclineLessPriceShowModalSheet(currentContext, tripRequest);}

    }

    _isNotificationClickHandled = false;
  }

  Future<void> handleBackgroundNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        handleNotificationClick(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotificationClick);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
    // Handle background message logic here if needed
  }
}
