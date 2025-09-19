


import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:messanger/model/addhelpers.dart';

class AdsProviders extends ChangeNotifier{

  bool isHomeBannerLoaded = false;
  late BannerAd homebannerad;

  bool isDetailBannerLoaded = false;
  late BannerAd detailedad;

  bool isfullinteridadloaded = false;
  late InterstitialAd fullpagead ;

  initializehomebanner()async{
    homebannerad = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelpers.homepageid(),
        listener: BannerAdListener(
          onAdFailedToLoad: (ad,error){
            print("ERRORRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
            print(error.toString());
            isHomeBannerLoaded = false;
            notifyListeners();
          },
          onAdClosed: (ad){
            print("Ad Closed");
            isHomeBannerLoaded = false;
            notifyListeners();
          },
          onAdLoaded: (ad){
            print("Ad loaded");
            isHomeBannerLoaded = true;
            notifyListeners();
          }
        ),
        request: AdRequest()
    );
    await homebannerad.load();
    notifyListeners();
  }


  void initiailzDetialBanner()async{
    detailedad = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelpers.detailid(),
        listener: BannerAdListener(
          onAdLoaded: (ad){
            print("Ad loaded");
            isDetailBannerLoaded = true;
          },
          onAdClosed: (ad){
            print("Ad Closed");
            isDetailBannerLoaded = false;
          },
          onAdFailedToLoad: (ad,error){
            print("Ads loaded failed");
            isDetailBannerLoaded = false;
          }
        ),
        request: AdRequest());
    await detailedad.load();
    notifyListeners();
  }

  void initializeFullpagead()async{
   await InterstitialAd.load(adUnitId: AdsHelpers.fullpageid(), request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ads){
              fullpagead = ads;
              isfullinteridadloaded = true;
            },
            onAdFailedToLoad: (error){
              print("Ads loaded failed");
              isfullinteridadloaded  = false;
            }));

   fullpagead.fullScreenContentCallback = FullScreenContentCallback(
     onAdDismissedFullScreenContent: (ad) {
       ad.dispose();
       isfullinteridadloaded = false;
       initializeFullpagead(); // next ad ready karne ke liye
     },
   );

    notifyListeners();
  }

}