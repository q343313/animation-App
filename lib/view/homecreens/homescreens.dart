

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messanger/config/domains/appcolor.dart';
import 'package:messanger/getex/navigationgetx.dart';
import 'package:messanger/riverpad/navigationriverpad.dart';
import 'package:messanger/view/bloccreens/blocscreens.dart';
import 'package:messanger/view/getxscreens/getxscreens.dart';
import 'package:messanger/view/mainscreen/mainscreens.dart';
import 'package:messanger/view/providersscreens/providerscreens.dart';
import 'package:messanger/view/riverpadscreen/riverpadcreens.dart';

class Homescreens extends ConsumerWidget {
   Homescreens({super.key});

  List<Widget>screen  = [
    Blocscreens(),
    Riverpadcreens(),
    Mainscreens(),
    Providerscreens(),
    Getxscreens()
  ];
  
  final Navigationcontroller navigationcontroller = Get.put(Navigationcontroller());

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // var index = ref.watch(navigationriverpad);
    return ProviderScope(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(CupertinoIcons.airplane),
            Icon(Icons.approval),
            Icon(Icons.home),
            Icon(Icons.get_app),
            Icon(Icons.person)
          ],
          backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.scaffolddarkmode
          : AppColors.scaffoldlightmode,
          color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white10
          :Colors.grey.shade200,
          index: navigationcontroller.index.value,
          // index: index,
          onTap: (val){
            // ref.read(navigationriverpad.notifier).state= val;
            navigationcontroller.changescreens(val);
          },
        ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
        body:
        // IndexedStack(
        //   index: index,
        //   children: screen,
        // )
        Obx(()=>IndexedStack(
          index: navigationcontroller.index.value,
          children: screen,
        ),)
      ),
    );
  }
}


// class Homescreens extends ConsumerStatefulWidget {
//   const Homescreens({super.key});
//
//   @override
//   ConsumerState<Homescreens> createState() => _HomescreensState();
// }
//
// class _HomescreensState extends ConsumerState<Homescreens> {
//   List<Widget>screen  = [
//     Blocscreens(),
//     Riverpadcreens(),
//     Mainscreens(),
//     Providerscreens(),
//     Getxscreens()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final index = ref.watch(navigationriverpad);
//     return Scaffold(
//     bottomNavigationBar: CurvedNavigationBar(
//       items: [
//         Icon(CupertinoIcons.airplane),
//         Icon(Icons.approval),
//         Icon(Icons.home),
//         Icon(Icons.get_app),
//         Icon(Icons.person)
//       ],
//       backgroundColor: Colors.white12,
//       color: AppColors.iconlightmode,
//       index: index,
//       onTap: (val){
//         ref.read(navigationriverpad.notifier).state= val;
//       },
//     ),
//       body: IndexedStack(
//         index: index,
//         children: screen,
//       ),
//     );
//   }
// }
