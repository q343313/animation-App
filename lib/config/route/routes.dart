


import 'package:flutter/material.dart';
import 'package:messanger/config/route/routenames.dart';
import 'package:messanger/view/authscreens/forgetpasswordscreens.dart';
import 'package:messanger/view/authscreens/loginscreens.dart';
import 'package:messanger/view/authscreens/signupscreens.dart';
import 'package:messanger/view/homecreens/homescreens.dart';
import 'package:messanger/view/introscreens/introscreens.dart';
import 'package:messanger/view/splashscreens/splashscreens.dart';

class Routes {
  static Route<dynamic>generateroute(RouteSettings seetting){
    switch(seetting.name){

      case RouteNames.splashcreens:
        return MaterialPageRoute(builder: (_)=>Splashscreens());
      case RouteNames.signupscreens:
        return MaterialPageRoute(builder: (_)=>Signupscreens());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_)=>Loginscreens());
      case RouteNames.reset:
        return MaterialPageRoute(builder: (_)=>Forgetpasswordscreens());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_)=>Homescreens());
      case RouteNames.introscreen:
        return MaterialPageRoute(builder: (_)=>IntroScreens());
      case _:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Route Found",style: TextStyle(fontFamily: "body_c",fontSize: 20),)
                ],
              ),
            ),
          );
        });
    }
  }
}