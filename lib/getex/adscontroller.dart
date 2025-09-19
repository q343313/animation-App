


import 'dart:math';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:messanger/model/addhelpers.dart';

class AdsController extends GetxController{


  RxBool ishomeBannerloaded = false.obs;
  late BannerAd homebannerad;
  late BannerAd detailbannerad;
  late InterstitialAd fullpageaad;
  RxBool isdetailbannerloaded = false.obs;
  RxBool isfullpageadloaded = false.obs;

  void initializedhomebanner()async{
    homebannerad  = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelpers.homepageid(),
        listener: BannerAdListener(
          onAdLoaded: (add){
            print("Home ads Loaded succesfully");
            ishomeBannerloaded.value = true;
          },
          onAdClosed: (value){
            value.dispose();
            ishomeBannerloaded.value = false;
          },
          onAdFailedToLoad: (ad,error){
            print(error.toString());
            ishomeBannerloaded.value  =false;
          }
        ),
        request: AdRequest()
    );

    await homebannerad.load();
  }

  void initializedDetailbanner()async{
    detailbannerad  = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelpers.homepageid(),
        listener: BannerAdListener(
            onAdLoaded: (add){
              print("Home ads Loaded succesfully");
              isdetailbannerloaded.value = true;
            },
            onAdClosed: (value){
              value.dispose();
              isdetailbannerloaded.value = false;
            },
            onAdFailedToLoad: (ad,error){
              print(error.toString());
              isdetailbannerloaded.value  =false;
            }
        ),
        request: AdRequest()
    );

    await detailbannerad.load();
  }

  void initialzefullpagead()async{
    await InterstitialAd.load(
        adUnitId: AdsHelpers.fullpageid(),
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ads){
              print("loaded ads ");
              fullpageaad = ads;
              isfullpageadloaded.value  = true;
            },
            onAdFailedToLoad: (error){
              isfullpageadloaded.value= false;
              print(error.toString());
            }));


  }

  callaaingadd(){
    fullpageaad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        isfullpageadloaded.value = false;
        initialzefullpagead();
      },
    );
  }



}