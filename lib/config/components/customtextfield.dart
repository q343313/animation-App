



import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domains/appcolor.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final TextEditingController?controller;
  final FocusNode?focusNode;
  final String?label;
  final String?hint;
  final TextInputType textInputType;
  final IconData?preffixicon;
  final IconButton?suffixicon;
  final bool?obstracttext;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  const CustomTextfieldWidget({
    super.key,
    this.textInputType = TextInputType.text,
    this.focusNode ,
    this.controller ,
    this.label ,
    this.suffixicon,
    this.preffixicon,
    this.hint,
    this.obstracttext,
    this.validator,
    this.onChanged,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontFamily: "body_c",fontSize: 13),
      focusNode: focusNode,
      validator:validator ,
      onChanged:onChanged ,
      onTap:onTap ,
      obscureText: obstracttext??false,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.blue)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.blue)
          ),
          prefixIcon: Icon(preffixicon,color: Theme.of(context).brightness == Brightness.dark?AppColors.icondarkmode:AppColors.iconlightmode,),
          suffixIcon: suffixicon,
          label: AutoSizeText(label??"",style: TextStyle(fontFamily: "body_p",fontSize: 20),),
          hintText: hint,
          hintStyle:  TextStyle(fontFamily: "body_c",fontSize: 13,color: Theme.of(context).brightness == Brightness.dark?AppColors.hintdarkmode:AppColors.hintlightmode,)
      ),
    );
  }
}