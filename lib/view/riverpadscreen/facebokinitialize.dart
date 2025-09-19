//
//
// import 'package:facebook_audience_network/ad/ad_banner.dart';
// import 'package:facebook_audience_network/ad/ad_interstitial.dart';
// import 'package:facebook_audience_network/ad/ad_native.dart';
// import 'package:facebook_audience_network/ad/ad_rewarded.dart';
//
// import '../../allpaths.dart';
//
// class Facebookinitialize {
//   bool isInterstitialAdLoaded = false;
//   bool isRewardedAdLoaded = false;
//
//   void loadInterstitialAd() {
//     FacebookInterstitialAd.loadInterstitialAd(
//       // placementId: "YOUR_PLACEMENT_ID",
//       placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
//       listener: (result, value) {
//         print(">> FAN > Interstitial Ad: $result --> $value");
//         if (result == InterstitialAdResult.LOADED) {
//           isInterstitialAdLoaded = true;
//         }
//
//         /// Once an Interstitial Ad has been dismissed and becomes invalidated,
//         /// load a fresh Ad by calling this function.
//         if (result == InterstitialAdResult.DISMISSED &&
//             value["invalidated"] == true) {
//           isInterstitialAdLoaded = false;
//           loadInterstitialAd();
//         }
//       },
//     );
//   }
//
//   void loadRewardedVideoAd() {
//     FacebookRewardedVideoAd.loadRewardedVideoAd(
//       placementId: "YOUR_PLACEMENT_ID",
//       listener: (result, value) {
//         print("Rewarded Ad: $result --> $value");
//         if (result == RewardedVideoAdResult.LOADED) isRewardedAdLoaded = true;
//         if (result == RewardedVideoAdResult.VIDEO_COMPLETE)
//
//           /// Once a Rewarded Ad has been closed and becomes invalidated,
//           /// load a fresh Ad by calling this function.
//           if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
//               (value == true || value["invalidated"] == true)) {
//             isRewardedAdLoaded = false;
//             loadRewardedVideoAd();
//           }
//       },
//     );
//   }
//
//   showInterstitialAd() {
//     if (isInterstitialAdLoaded == true) {
//       FacebookInterstitialAd.showInterstitialAd();
//     } else {
//       print("Interstial Ad not yet loaded!");
//     }
//   }
//
//   showRewardedAd() {
//     if (isRewardedAdLoaded == true) {
//       FacebookRewardedVideoAd.showRewardedVideoAd();
//     } else {
//       print("Rewarded Ad not yet loaded!");
//     }
//   }
//
//
//
//   Widget nativeBannerAd() {
//     return FacebookNativeAd(
//       // placementId: "YOUR_PLACEMENT_ID",
//       placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
//       adType: NativeAdType.NATIVE_BANNER_AD,
//       bannerAdSize: NativeBannerAdSize.HEIGHT_100,
//       width: double.infinity,
//       backgroundColor: Colors.blue,
//       titleColor: Colors.white,
//       descriptionColor: Colors.white,
//       buttonColor: Colors.deepPurple,
//       buttonTitleColor: Colors.white,
//       buttonBorderColor: Colors.white,
//       listener: (result, value) {
//         print("Native Banner Ad: $result --> $value");
//       },
//     );
//   }
//
//
// //   Widget nativeAd() {
// //     return FacebookNativeAd(
// //       placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964952163583650",
// //       adType: NativeAdType.NATIVE_AD_VERTICAL,
// //       width: double.infinity,
// //       height: 300,
// //       backgroundColor: Colors.blue,
// //       titleColor: Colors.white,
// //       descriptionColor: Colors.white,
// //       buttonColor: Colors.deepPurple,
// //       buttonTitleColor: Colors.white,
// //       buttonBorderColor: Colors.white,
// //       listener: (result, value) {
// //         print("Native Ad: $result --> $value");
// //       },
// //       keepExpandedWhileLoading: true,
// //       expandAnimationDuraion: 1000,
// //     );
// //   }
// // }
