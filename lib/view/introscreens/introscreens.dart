
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:messanger/allpaths.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final introkey = GlobalKey<IntroductionScreenState>();
  final decoration= PageDecoration(
  titleTextStyle: TextStyle(fontFamily: "heading_c",fontSize: 25),
  bodyTextStyle: TextStyle(fontFamily: "body_p",fontSize: 23),
  pageMargin: EdgeInsets.symmetric(horizontal: 38),
    // bodyAlignment: Alignment.center,
    // contentMargin: EdgeInsets.symmetric(horizontal: 30),
    fullScreen: false
  );

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introkey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: "Friendly & Modern",
          body: "Connect instantly with friends and family. Share your thoughts, moments, and stories—anytime, anywhere.",
        decoration: decoration,
          image: Image(image: AssetImage("assets/images/pngegg (4).png"),width: 300,height: 200,)
        ),
        PageViewModel(
            title: "Focus on Messaging",
            body:"Fast, secure, and reliable messaging. Stay close to the people who matter most.",
            decoration: decoration,
            image: Image(image: AssetImage("assets/images/pngegg (5).png"),width: 300,height: 200,)
        ),
        PageViewModel(
            title: "Global & Community",
            body: "One world, one chat. Talk without limits and bring your conversations to life",
            decoration: decoration,
            image: Image(image: AssetImage("assets/images/pngegg (6).png"),width: 300,height: 200,)
        )
      ],
      showBackButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showSkipButton: true,
      showBottomPart: true,
      showFirstBackButton: true,
      showDoneButton: true,
      onDone: ()=>Navigator.pushReplacementNamed(context, RouteNames.signupscreens),
      onSkip: ()=>Navigator.pushReplacementNamed(context, RouteNames.signupscreens),
      done: Text("Done",style: TextStyle(fontFamily: "heading_c",fontSize: 20),),
      skip: const Text('Skip', style: TextStyle(fontFamily: "heading_c")),
      next: Icon(Icons.arrow_forward),
      back: Icon(Icons.arrow_back_sharp),
    );
  }
}
