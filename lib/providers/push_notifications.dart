import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications(){

    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){
      print('======== FCM TOKEN =======');
      print(token);

      //fKT-nWjwyJo:APA91bEc8IdW6J5KX3Ra3czqV1opaTTB-1mzbFWF9aoNzdCC2PDaFuJqNaYWcgsnteS9Gw30a9_sGnjWoPuXJ2Se2X_m2k8xYIBwKVi7KQz4wz-S3PAJ1GWlfAhgTYOSU_6KO_3C5bxG
    });

    _firebaseMessaging.configure(
      onMessage: (info) {
        print('====== On Message ======');
        print(info);
        String arguments = 'no-data';
        if(Platform.isAndroid){
          arguments = info['data']['comida'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(arguments);
        return;
      },
      onLaunch: (info) {
        print('====== On Launch ======');
        print(info);


        return;
      },
      onResume: (info) {
        print('====== On Resume ======');
        print(info);

        final noti = info['data']['comida'];
        print(noti);
        String arguments = 'no-data';
        if(Platform.isAndroid){
          arguments = noti ?? 'no-data';
        }
        _mensajesStreamController.sink.add(arguments);
        return;
      },
    );
  }
  dispose(){
    _mensajesStreamController.close();
  }
}