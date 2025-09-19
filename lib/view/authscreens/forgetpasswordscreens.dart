
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messanger/allpaths.dart';
import 'package:messanger/riverpad/resetproviders.dart';
import 'package:messanger/view/authscreens/signupscreens.dart';

import '../../config/components/authidgets/customwuthbutton.dart';
import '../../config/components/customtextfield.dart';
import '../../config/route/routenames.dart';

class Forgetpasswordscreens extends ConsumerStatefulWidget {
  const Forgetpasswordscreens({super.key});

  @override
  ConsumerState<Forgetpasswordscreens> createState() => _ForgetpasswordscreensState();
}

class _ForgetpasswordscreensState extends ConsumerState<Forgetpasswordscreens> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 220,),
                  Customheadingwidget(text: "Send email reset password", heading: "Forget password",),

                  SizedBox(height: 30,),
                  CustomTextfieldWidget(
                    label: "Email",
                    hint: "***********@gmail.**",
                    preffixicon: Icons.email,
                    validator: (value)=>AppVallidations.emailvalidation(value.toString()),
                    onChanged: (value)=>ref.read(resetproviders.notifier).addemail(value),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(height: 40,),
                  // SignupActionButton().animate().fade(duration: 900.ms).scale(delay: 1100.ms),

                  SizedBox(
                    width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            if(formkey.currentState!.validate()){
                              ref.read(resetproviders.notifier).sendemailreset();
                            }
                          },
                          child: Consumer(builder: (context,ref,child){
                            final reset = ref.watch(resetproviders);
                            switch(reset.resetEnum){
                              case ResetEnum.loading:
                                return CupertinoActivityIndicator();
                              case ResetEnum.success:
                              case ResetEnum.failure:
                              case ResetEnum.initial:
                                return Text("Send email",style: TextStyle(color: Colors.white,fontFamily: "heading_c"),);
                            }
                          }))),

                  SizedBox(height: 20,),
                  CustomAuthButton(callback: (){Navigator.pushReplacementNamed(context, RouteNames.signupscreens);},text: "Don't have account?",buttonname: "Signup",).animate().fade(duration: 1300.ms).scale(delay: 1500.ms),
                ],
              ),
            ),
          )

      ).animate().fade(duration: 500.ms).scale(delay: 500.ms),

    );
  }
}
