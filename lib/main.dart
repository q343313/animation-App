


import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:messanger/allpaths.dart';
import 'package:messanger/bloc/imagebloc/imagebloc.dart';
import 'package:messanger/bloc/updatebloc/updatebloc.dart';
import 'package:messanger/data/notificationdata/notificationservices.dart';
import 'package:messanger/providers/adsproviders.dart';
import 'package:messanger/repository/imagerepository.dart';
import 'package:provider/provider.dart';

import 'data/firebasedata/notificattiondata.dart';
import 'firebase_options.dart';

// final navigatorkey = GlobalKey<Navigato>()
late List<CameraDescription> cameras;
GetIt getIt = GetIt.instance;
void main()async{
  injection();
  WidgetsFlutterBinding.ensureInitialized();
    cameras= await availableCameras();
  // FacebookAudienceNetwork.init(
  //   testingId: "a77955ee-3304-4635-be65-81029b0f5201", // abhi blank rehne do
  //   iOSAdvertiserTrackingEnabled: true,
  // );
    MobileAds.instance.initialize();
  // await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  FirebaseMessaging.onBackgroundMessage(background);
  FirebaseMessaging.onMessageOpenedApp.listen((message)=>NotificationServices().handlenotification(message.data));
  runApp(  MyApp());
}

@pragma('vm:entry-point')
Future<void>background(RemoteMessage message)async{
  NotificationServices().handlenotification(message.data);
  NotificationData().adddatainfirebase(message);
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(providers: [
     BlocProvider(create: (_)=>ThemeCubits()),
     BlocProvider(create: (_)=>DefaultBloc()),
     BlocProvider(create: (_)=>ImageBloc(getIt())),
     BlocProvider(create: (_)=>UpdatedBloc())
   ],
       child: MultiProvider(
         providers: [ChangeNotifierProvider(create: (_)=>AdsProviders())],
         child: BlocBuilder<ThemeCubits,ThemeStates>(builder: (context,state){
           return GetMaterialApp(
             theme: state is LightThemeStates?AppThemes.lightthemedata:AppThemes.darkthemedata,
             title: "State Managment",
             initialRoute: RouteNames.splashcreens,
             onGenerateRoute: Routes.generateroute,
           );
         }),
       ));
  }

}

void injection(){
  getIt.registerLazySingleton<FirebaseAuthentiction>(()=>FirebaseAuthentiction());
  getIt.registerLazySingleton<NotificationData>(()=>NotificationData());
  getIt.registerLazySingleton<ImageRepository>(()=>ImageRepository());
}