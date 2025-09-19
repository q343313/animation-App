


import 'dart:io';

class  AdsHelpers {

 static String homepageid(){
    if(Platform.isAndroid){
    return "ca-app-pub-3940256099942544/6300978111";
    }else if(Platform.isIOS){
    return "ca-app-pub-3940256099942544/6300978111";
    }
    return "ca-app-pub-3940256099942544/6300978111";
  }

 static String detailid(){
    if(Platform.isAndroid){
      return "ca-app-pub-3940256099942544/6300978111";
    }else if(Platform.isIOS){
      return "ca-app-pub-3940256099942544/6300978111";
    }
    return "ca-app-pub-3940256099942544/6300978111";
  }

 static String fullpageid(){
    if(Platform.isAndroid){
      return "ca-app-pub-3940256099942544/1033173712";
    }else if(Platform.isIOS){
      return "ca-app-pub-3940256099942544/1033173712";
    }
    return "ca-app-pub-3940256099942544/1033173712";
  }

}