

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:messanger/bloc/themebloc/themecubits.dart';
import 'package:messanger/data/notificationdata/getserverkey.dart';
import 'package:messanger/main.dart';
import 'package:messanger/view/bloccreens/addinitiilize.dart';




class Mainscreens extends StatefulWidget {
  const Mainscreens({super.key});

  @override
  State<Mainscreens> createState() => _MainscreensState();
}

class _MainscreensState extends State<Mainscreens>{
  late CameraController cameraController ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraController  = CameraController(cameras[0], ResolutionPreset.veryHigh);
    cameraController.initialize().then((value){
      if(!mounted){
        return;
      }
      setState(() {});
    }).catchError((Object e){
      if(e is CameraException){
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screens"),
      ),
      body:!cameraController.value.isInitialized?Container():
      CameraPreview(cameraController,child: InkWell(
        onLongPress: (){
          cameraController.startVideoRecording();
        },
        onTap: ()async{
         await cameraController.stopVideoRecording();
        },
      ),),
    );
  }

}


// class _MainscreensState extends State<Mainscreens> {
//
//   final AddsInitilize addsInitilize = AddsInitilize();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     MobileAds.instance.updateRequestConfiguration(
//         RequestConfiguration(testDeviceIds: [testDevice]));
//
//     addsInitilize.createInterstitialAd();
//     addsInitilize.createRewardedAd();
//     addsInitilize.createRewardedInterstitialAd();
//     super.initState();
//     showads();
//   }
//
//   showads()async{
//    await Future.delayed(Duration(seconds:30 ),(){
//      print("Second");
//       addsInitilize.showInterstitialAd();
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     addsInitilize.interstitialAd?.dispose();
//     addsInitilize.rewardedAd?.dispose();
//     addsInitilize.rewardedInterstitialAd?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Main"),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(onPressed: (){
//             BlocProvider.of<ThemeCubits>(context).toggletheme();
//           }, icon: Icon(Icons.dark_mode)),
//           IconButton(onPressed: ()async{
//             GetServerkey serverkey = GetServerkey();
//             final servertoken = await serverkey.servertoken();
//             print(servertoken);
//           }, icon: Icon(Icons.notification_add))
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(onPressed: (){
//               addsInitilize.showInterstitialAd();
//             }, child: Text("Reward Ads")),
//             ElevatedButton(onPressed: (){
//               addsInitilize.showRewardedAd();
//             }, child: Text("Reward Ads")),
//             ElevatedButton(onPressed: (){
//               addsInitilize.showRewardedInterstitialAd();
//             }, child: Text("Reward Ads")),
//             ElevatedButton(onPressed: (){}, child: Text("Reward Ads"))
//           ],
//         ),
//       ),
//     );
//   }
// }
