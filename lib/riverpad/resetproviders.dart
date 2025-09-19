

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:messanger/allpaths.dart';
import 'package:messanger/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ResetEnum {loading,success,failure,initial}

final resetproviders = StateNotifierProvider<ResetNotifiers,ResetStates>((ref)=>ResetNotifiers(getIt()));

class ResetNotifiers extends StateNotifier<ResetStates>{
  final FirebaseAuthentiction firebaseAuthentiction;
  ResetNotifiers(this.firebaseAuthentiction):super(ResetStates());

  addemail(String email){
    state = state.copyWith(email: email);
  }

  sendemailreset()async{
    state = state.copyWith(resetEnum: ResetEnum.loading);
    try {

      await firebaseAuthentiction.resetpassword(state.email);
      state  = state.copyWith(resetEnum: ResetEnum.success,message: "Send Email Reset password");
      Get.snackbar("Reset password",state.message);
      Get.offAndToNamed(RouteNames.login);
      resetusersatate();

    }on FirebaseAuthException catch(e){
      state = state.copyWith(message: e.code.toString(),resetEnum: ResetEnum.failure);
    }
  }


  resetusersatate(){
    state = state.copyWith(email: "",resetEnum: ResetEnum.initial,message: "");
  }

  logoutuseraccount()async{
    var pref = await SharedPreferences.getInstance();
    await firebaseAuthentiction.logoutuser();
    pref.remove("image");
    Get.offAndToNamed(RouteNames.signupscreens);
    Get.snackbar("Logout", "UserLogout Succesfully");
  }

}

class ResetStates {

  final ResetEnum resetEnum;
  final String email;
  final String message;
  ResetStates({this.resetEnum= ResetEnum.initial,this.email ="",this.message = ""});
  ResetStates copyWith({
    ResetEnum?resetEnum,
     String?email,
     String?message
}){
    return ResetStates(
      email: email??this.email,
      message: message??this.message,
      resetEnum: resetEnum??this.resetEnum
    );
  }

}