


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:messanger/allpaths.dart';
import 'package:messanger/config/route/routenames.dart';

class SplashServices{
  static is_logins(BuildContext context){
    final FirebaseAuthentiction firebaseAuthentiction = FirebaseAuthentiction();
    final user = firebaseAuthentiction.auth.currentUser;
    Timer.periodic(Duration(seconds: 4), (_){
      if(user == null){
        Navigator.pushReplacementNamed(context, RouteNames.introscreen);
      }else{
        Navigator.pushReplacementNamed(context, RouteNames.home);
      }
    });
  }
}