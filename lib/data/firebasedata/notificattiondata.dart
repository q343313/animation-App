


import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationData {

  final collection = FirebaseFirestore.instance.collection("message");

  adddatainfirebase(RemoteMessage message)async{
    await collection.add({
      "title":message.notification!.title,
      "body":message.notification!.body,
      "data":jsonEncode(message.data),
      "datetime":"${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"
    });
  }

  deletenotification(String id)async{
    await collection.doc(id).delete();
  }

  deletelistnotification(List<String> messageid)async{
    for (var i in messageid){
      await collection.doc(i).delete();
    }
  }
}