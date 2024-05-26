import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_app/Controller/Constants.dart';

class FirebaseNotifications {

  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications ()async{
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    fcmToken = token;
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
    print(fcmToken);
  }
  void handleMessage (RemoteMessage? message){
    if(message == null) return; else{
      print(message.data);
    }
  }
  Future handleBackgroundNotifications()async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
  Future handle(BuildContext context)async{
    FirebaseMessaging.onMessage.listen((RemoteMessage message,) {
      showSimpleDialogs(context, '${message.notification!.title}', '${message.notification!.body}',null);
      print(message.notification!.body);
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification!.title}');
      }
    });
  }
}