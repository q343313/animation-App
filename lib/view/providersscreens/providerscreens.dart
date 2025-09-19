

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:messanger/getex/adscontroller.dart';
import 'package:messanger/model/addhelpers.dart';
import 'package:messanger/providers/adsproviders.dart';
import 'package:provider/provider.dart';

class Providerscreens extends StatefulWidget {
  const Providerscreens({super.key});

  @override
  State<Providerscreens> createState() => _ProviderscreensState();
}
class _ProviderscreensState extends State<Providerscreens>{
  @override
  Widget build(BuildContext context) {
   return Scaffold();
  }

}
// class _ProviderscreensState extends State<Providerscreens> {
//   final AdsController adsController  = Get.put(AdsController());
//   @override
//   void initState() {
//     // TODO: implement initState
//     // Provider.of<AdsProviders>(context,listen: false).initializehomebanner();
//     adsController.initializedDetailbanner();
//     adsController.initializedhomebanner();
//     adsController.initialzefullpagead();
//
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     Provider.of<AdsProviders>(context,listen: false).initializehomebanner();
//   }
//   @override
//   Widget build(BuildContext context) {
//     print(AdsHelpers.detailid());
//     print(AdsHelpers.fullpageid());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Provider"),
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Obx(()=>adsController.isdetailbannerloaded.value?
//             Container(
//                 width: double.infinity,
//                 height: 60,
//                 child: AdWidget(ad: adsController.detailbannerad)):
//             Container()),
//             ElevatedButton(onPressed: (){
//               if (adsController.isfullpageadloaded.value) {
//                 adsController.fullpageaad.show();
//                 adsController.callaaingadd();
//               }
//             }, child: Text("Intestied Ads"))
//           ],
//         ),
//       ),
//       bottomNavigationBar:
//       // Consumer<AdsProviders>(
//       //   builder: (context, adsProvider, _) {
//       //     if (adsProvider.isHomeBannerLoaded) {
//       //       return Container(
//       //         alignment: Alignment.center,
//       //         width: adsProvider.homebannerad.size.width.toDouble(),
//       //         height: adsProvider.homebannerad.size.height.toDouble(),
//       //         child: AdWidget(ad: adsProvider.homebannerad),
//       //       );
//       //     } else {
//       //       return SizedBox.shrink(); // jab ad load na ho to blank
//       //     }
//       //   },
//       // ),
//
//       Obx(()=>adsController.ishomeBannerloaded.value?
//       Container(
//         width: double.infinity,
//           height: 60,
//           child: AdWidget(ad: adsController.homebannerad)):
//       Container(width: double.infinity,height: 50,color: Colors.blue,)),
//     );
//   }
// }
