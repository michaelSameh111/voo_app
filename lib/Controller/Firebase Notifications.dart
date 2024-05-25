import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:voo_app/Controller/Constants.dart';

class FirebaseNotifications {

  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications ()async{
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    fcmToken = token;
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
}