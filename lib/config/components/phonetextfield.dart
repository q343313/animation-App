


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appvallidation/appvallidation.dart';
import 'customtextfield.dart';

class PhoneTextField extends StatelessWidget {
  final String countrycode;
  final TextEditingController controller;
  final VoidCallback callback;
  final Function(String)? onChanged;
  const PhoneTextField({super.key,required this.controller,required this.countrycode,required this.callback,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: InkWell(
              onTap: callback,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.blue,),
                    border: Border(top: BorderSide(color: Colors.blue),left:  BorderSide(color: Colors.blue),bottom:  BorderSide(color: Colors.blue),right: BorderSide.none),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text(countrycode,style: TextStyle(fontFamily: "body_c",fontSize: 15),),),
              ),
            )),
        Expanded(
            flex: 7,
            child: CustomTextfieldWidget(
              label: "Phone",
              hint: "3************",
              controller: controller,
              onChanged:onChanged ,
              validator: (value)=>AppVallidations.phonevalidation(value.toString()),
            ))
      ],
    );
  }
}


