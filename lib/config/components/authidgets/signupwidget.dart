


import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../bloc/defaulbloc/defaultboc.dart';
import '../../../getex/signupgetex/signupgetx.dart';
import '../../../view/authscreens/signupscreens.dart';
import '../../appvallidation/appvallidation.dart';
import '../customtextfield.dart';
import '../phonetextfield.dart';

Widget buildcheckboxwidget(BuildContext context){
  final width = MediaQuery.of(context).size.width;
  return BlocBuilder<DefaultBloc, DefaultStates>(
    builder: (context, state) {
      return GestureDetector(
        onTap: ()=>context.read<DefaultBloc>().add(OnCheckbox()),
        child: Row(
          children: [
            Checkbox(value: state.checkbox, onChanged: (value){}),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AutoSizeText("Are you agree to accept all the term and\nprivacy of the app.",
                maxFontSize: 22,minFontSize: 18,style: TextStyle(
                    fontSize: width * 0.025,fontFamily: "body_p"
                ),),
            )

          ],
        ),
      );
    },
  );
}


Widget buildemailfield(TextEditingController controller){
  return CustomTextfieldWidget(
    label: "Email",hint: "***********@gmail.**",
    preffixicon: Icons.email,controller: controller,
    validator: (value)=>AppVallidations.emailvalidation(value.toString()),
  );
}
Widget buildpaswordfield(TextEditingController controller){
  return  BlocBuilder<DefaultBloc, DefaultStates>(
    builder: (context, state) {
      return CustomTextfieldWidget(label: "Password",
        hint: "Password",
        obstracttext: state.showpassword,
        controller: controller,
        validator: (value)=>AppVallidations.passwordvalidations(value.toString()),
        preffixicon: Icons.lock,
        suffixicon: IconButton(
            onPressed: (){
              context.read<DefaultBloc>().add(ShowPassword());
            },
            icon: Icon(state.showpassword?Icons.visibility_off:Icons.visibility)),);
    },
  );
}
Widget buildusernameefield(TextEditingController controller){
  return CustomTextfieldWidget(
    label: "Username",
    hint: "Username",
    validator: (value)=>AppVallidations.usernamevalidation(value.toString()),
    preffixicon: Icons.account_circle,
    controller:controller ,
  );
}
Widget buildphonefield(TextEditingController controller,SignupController signupController,BuildContext context){
  return  Obx(()=>PhoneTextField(
      controller: controller,
      countrycode: signupController.countrycode.value,
      callback: ()=>showCountryPicker(context: context, onSelect:(value)=>
          signupController.changecountrycode("${value.flagEmoji} +${value.phoneCode}"))),);
}
Widget builddoffield(SignupController controller,BuildContext context){
  return Obx(()=>CustomTextfieldWidget(
    label: "Date of birth",
    hint: "${controller.dateofbirth.value.day}-${controller.dateofbirth.value.month}-${controller.dateofbirth.value.year}",
    preffixicon: Icons.child_care,
    onTap: ()async{
      DateTime?datetime = await showDatePicker(
          context: context,
          firstDate: DateTime(1980),
          lastDate: DateTime.now()
      );
      if(datetime != null){
        controller.changedateofbith(datetime);
      }
    },

  ));
}