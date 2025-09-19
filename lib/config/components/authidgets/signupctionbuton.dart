


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../bloc/defaulbloc/defaultboc.dart';
import '../../../getex/signupgetex/signupgetx.dart';

class SignupActionButton extends StatelessWidget {
  const SignupActionButton({super.key,required this.signupController,required this.formkey});

  final SignupController signupController;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: (){
        print(signupController.usernamecontroller.value.text);
        if(formkey.currentState!.validate()){
          final state = context.read<DefaultBloc>().state;
          if(state.checkbox ==false){
            Get.snackbar("Checkbox", "Please fill the checkbox",icon: Icon(Icons.warning),snackPosition: SnackPosition.TOP,backgroundColor: Colors.orange);
          }else{
            print(signupController.countrycode.value);
            print(signupController.emailcontroller.value.text);
            print(signupController.phonecontroller.value.value);
            print(signupController.usernamecontroller.value.value);
            print(signupController.phonecontroller.value.value);
            signupController.signupurccount();
            // context.read<DefaultBloc>().add(OffCheckBox());
          }
        }
      }
          , child: Obx((){
            if(signupController.signupenum == SignUpGetxEnum.loading){
              return CupertinoActivityIndicator(color: Colors.white,);
            }else{
              return AutoSizeText("Signup",style: TextStyle(color: Colors.white),).animate()
                  .fadeIn() // uses `Animate.defaultDuration`
                  .scale() // inherits duration from fadeIn
                  .move(delay: 1900.ms, duration: 1500.ms).animate()
                  .fadeIn() // uses `Animate.defaultDuration`
                  .scale() // inherits duration from fadeIn
                  .move(delay: 1300.ms, duration: 1000.ms);
            }
          })
      ),
    );
  }
}