
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:messanger/config/services/splashservices.dart';
import 'package:messanger/data/notificationdata/notificationservices.dart';
import 'package:messanger/providers/adsproviders.dart';
import 'package:messanger/view/bloccreens/addinitiilize.dart';
import 'package:provider/provider.dart';

class Splashscreens extends StatefulWidget {
  const Splashscreens({super.key});

  @override
  State<Splashscreens> createState() => _SplashscreensState();
}

class _SplashscreensState extends State<Splashscreens> {

  final NotificationServices notificationServices = NotificationServices();
  final AddsInitilize addsInitilize = AddsInitilize();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    notificationServices.init();
    notificationServices.getpermission();
    setbasckgroundmessage();
    notificationServices.gettoken().then((value)=>print(value));
    notificationServices.firebaseinit();
    SplashServices.is_logins(context);
    MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: [testDevice]));

    addsInitilize.createInterstitialAd();
    addsInitilize.createRewardedAd();
    addsInitilize.createRewardedInterstitialAd();
  }

  setbasckgroundmessage()async{
   await notificationServices.backgroundmessage();
  }

  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;
    return Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/lo.png"),
                width: 300,height: 300,)
                  .animate()
                  .fade(duration: 500.ms)
                  .scale(delay: 800.ms)
            ],
          ),
        ),
      
        floatingActionButton: AutoSizeText("State controll",
        maxFontSize: 29,
        minFontSize: 24,
        style: TextStyle(
          fontSize: width * 0.025,
          fontFamily: "heading_c"
        ),).animate()
            .fadeIn() // uses `Animate.defaultDuration`
            .scale() // inherits duration from fadeIn
            .move(delay: 300.ms, duration: 600.ms).fade(duration: 500.ms)
            .scale(delay: 800.ms),
            // .animate()
      
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
