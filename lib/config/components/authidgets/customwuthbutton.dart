




import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final String buttonname;
  final VoidCallback callback;
  const CustomAuthButton({super.key,required this.callback,required this.text,required this.buttonname});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            SizedBox(width: 5,),
            AutoSizeText("OR",style: TextStyle(fontFamily: "body_p",fontSize: 25),),
            SizedBox(width: 5,),
            Expanded(child: Divider())
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/go1.jpg"),
            ),
            SizedBox(width: 7,),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/ph1.png"),
            )
          ],
        ),
        SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(text,maxFontSize:34,minFontSize : 25,style: TextStyle(fontSize:width * 0.025,fontFamily: "body_p" ),),
            TextButton(onPressed: callback,
                child: AutoSizeText(
                  buttonname,maxFontSize:23,
                  minFontSize : 20,
                  style: TextStyle(
                      fontSize:width * 0.025,
                      fontFamily: "heading_c",
                      color: Colors.blue
                  ),))
          ],
        )
      ],
    );
  }
}

class Customheadingwidget extends StatelessWidget {
  const Customheadingwidget({super.key,required this.text,required this.heading});

  final String heading;
  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          heading,
          minFontSize: 28,
          maxFontSize: 35,
          style: TextStyle(fontFamily: "heading_c",fontSize: width * 0.025),),

        AutoSizeText(
          text,
          minFontSize: 24,
          maxFontSize: 29,
          style: TextStyle(fontFamily: "body_p",fontSize: width * 0.025),)
      ],
    );
  }
}
