
import 'package:flutter/material.dart';
import 'package:messanger/view/riverpadscreen/facebokinitialize.dart';

class Riverpadcreens extends StatefulWidget {
  const Riverpadcreens({super.key});

  @override
  State<Riverpadcreens> createState() => _RiverpadcreensState();
}

class _RiverpadcreensState extends State<Riverpadcreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpad"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
            }, child: Text("Facebok Reward Ads")),
            ElevatedButton(onPressed: (){

            }, child: Text("Facebook Interp Ads")),
            ElevatedButton(onPressed: (){

            }, child: Text("Facebook BannerAd Ads")),
            ElevatedButton(onPressed: (){}, child: Text("Reward Ads"))
          ],
        ),
      ),
    );
  }
}
