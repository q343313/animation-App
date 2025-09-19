


import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:messanger/data/firebasedata/notificattiondata.dart';

class NotificationServices{

  final FirebaseMessaging firebaseMessaging= FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();

  void init()async{
    AndroidInitializationSettings androidInitializationSettings  = AndroidInitializationSettings("@mipmap/ic_launcher");
    DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings();
    InitializationSettings initializationSettings  = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse respone){
      if(respone.payload != null || respone.payload!.isNotEmpty){
        Map<String,dynamic>mappayload = jsonDecode(respone.payload!);
        handlenotification(mappayload);
      }
      }
    );
  }

  void getpermission()async{

    NotificationSettings notificationSettings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
       carPlay: true,
      criticalAlert: true,
      providesAppNotificationSettings: true,
      provisional: true,
      sound: true
    ) ;
    if(notificationSettings.authorizationStatus== AuthorizationStatus.authorized){
      print("Authorized message");
    }else if(notificationSettings.authorizationStatus == AuthorizationStatus.provisional){
      print("Provesional notification");
    }else{
      print("No Notification show");
    }
  }

  Future<String>gettoken()async{
    String ?token = await firebaseMessaging.getToken();
    return token!;
  }

  refeashtoken(){
    firebaseMessaging.onTokenRefresh.listen((val)=>print(val));
  }

  void firebaseinit()async {
    FirebaseMessaging.onMessage.listen((message) {
      print("Message ${message.notification!.title}");
      print("${message.notification!.body}");
      shownotification(message);
      NotificationData().adddatainfirebase(message);
    });
  }

  Future<void>shownotification(RemoteMessage message)async{
    AndroidNotificationChannel androidNotificationChannel =AndroidNotificationChannel("my_channel_id", "My Channel id",importance: Importance.min);
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    androidNotificationChannel.id.toString()
        , androidNotificationChannel.name.toString(),importance: Importance.high,
    priority: Priority.high,
    icon: "@mipmap/ic_launcher",
    ticker: "ticker",
    );

    DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBanner: true,
      presentSound: true
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    final id = Random().nextInt(1000);
    String payload = jsonEncode(message.data);

    Future.delayed(Duration.zero,(){
      flutterLocalNotificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          payload: payload,
          notificationDetails
      );
    });

  }

  Future<void>handlenotification(Map<String,dynamic>payload)async{
    if(payload["next"] == "message"){
    }
  }

  Future<void>backgroundmessage()async{
    RemoteMessage? message = await firebaseMessaging.getInitialMessage();
    if(message != null){
      handlenotification(message.data);
      NotificationData().adddatainfirebase(message);
    }

  }

}