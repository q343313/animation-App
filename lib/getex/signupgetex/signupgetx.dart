


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messanger/config/route/routenames.dart';
import 'package:messanger/data/firebasedata/firebaseauthentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SignUpGetxEnum {loading,failure,success,initial,exists}

class SignupController extends GetxController{

  final FirebaseAuthentiction firebaseAuthentiction = FirebaseAuthentiction();

  final usernamecontroller = TextEditingController().obs;
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;
  final dateofbirth = DateTime.now().obs;
  RxString countrycode = "🇵🇰 +92".obs;
  final phonecontroller = TextEditingController().obs;
final signupenum= SignUpGetxEnum.initial.obs;
RxString message= "".obs;

changecountrycode(String code){
  countrycode.value = code;
}

changesignupenum(SignUpGetxEnum een){
  signupenum.value = een;
}
changedateofbith(DateTime datetime){
  dateofbirth.value = datetime;
}


signupurccount()async{
  changesignupenum(SignUpGetxEnum.loading);
  try {
    await firebaseAuthentiction.signupuseraccount(emailcontroller.value.text, passwordcontroller.value.text);
    // datasave_in_database();
    final datetime = "${dateofbirth.value.day}-${dateofbirth.value.month}-${dateofbirth.value.year}";
    var pref = await SharedPreferences.getInstance();
    pref.setString("username", usernamecontroller.value.text);
    pref.setString("email", emailcontroller.value.text);
    pref.setString("password", passwordcontroller.value.text);
    pref.setString("phone", phonecontroller.value.text);
    pref.setString("dateofbirth", datetime);
    pref.setString("countrycode", countrycode.value);
    pref.setString("image", "");
    changesignupenum(SignUpGetxEnum.success);
    message.value = "User Account created succesfully";
    Get.toNamed(RouteNames.home);
    Get.snackbar("Signup Succesfully", "User account created successfully",backgroundColor: Colors.green);
    resetstates();

  }on FirebaseAuthException catch(e){
    if(e.code== "email-already-in-use"){
      changesignupenum(SignUpGetxEnum.exists);
      message.value  = e.code.toString();
      Get.toNamed(RouteNames.login);
      Get.snackbar("User exists", "User account Already exists please login",backgroundColor: Colors.orange);
      resetstates();
    }else{
      changesignupenum(SignUpGetxEnum.failure);
      message.value  = e.code.toString();
      Get.snackbar("Signup Failed", e.toString(),backgroundColor: Colors.red);
      resetstates();
    }
  }

}


resetstates(){
  emailcontroller.value.clear();
  passwordcontroller.value.clear();
  usernamecontroller.value.clear();
  dateofbirth.value= DateTime.now();
  changesignupenum(SignUpGetxEnum.initial);
  countrycode.value = "🇵🇰 +92";
  phonecontroller.value.clear();
}

datasave_in_database()async{
  final phone = "${countrycode}${phonecontroller.value.text}";
  final datetime = "${dateofbirth.value.day}-${dateofbirth.value.month}-${dateofbirth.value.year}";
  var pref = await SharedPreferences.getInstance();
  pref.setString("username", usernamecontroller.value.text);
  pref.setString("email", emailcontroller.value.text);
  pref.setString("password", passwordcontroller.value.text);
  pref.setString("phone", phonecontroller.value.text);
  pref.setString("dateofbirth", datetime);
  pref.setString("countrycode", countrycode.value);
}

}