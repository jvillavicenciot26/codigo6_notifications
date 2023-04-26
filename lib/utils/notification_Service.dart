import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    print(token);
    firebaseMessaging.subscribeToTopic("PEPE");
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  static _onMessage(RemoteMessage message) async {
    if (message.notification != null) {
      print("_onMessage");
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  //Aplicacion en segundo plano
  static Future _onBackgroundMessage(RemoteMessage message) async {
    if (message.notification != null) {
      print("_onBackgroundMessage");
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  //Aplicacion Cerrada
  static Future _onMessageOpenedApp(RemoteMessage message) async {
    if (message.notification != null) {
      print("_onMessageOpenedApp");
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }
}
