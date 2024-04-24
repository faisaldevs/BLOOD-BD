import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:blood_bd/screens/depandency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_notifications/notification_services.dart';
import 'firebase_options.dart';
import 'utils/app_routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   // NotificationService().initNotification();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
//
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(channelKey: "channelKey", channelName: "channelName", channelDescription: "channelDescription"),

  ],debug: true,);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HttpOverrides.global = PostHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.redAccent,
    statusBarColor: Colors.redAccent,
  ));

  await GetStorage.init();
  runApp(const MyApp());
  DependencyInjection.init();
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.firebaseInit();
    notificationServices.isTokenRefresh();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken().then((value) {
      print("Device Token: $value");
    });

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(460, 909),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'BLOOD BD',
          theme: ThemeData(
            useMaterial3: true,
          ),
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          getPages: pages,
          initialRoute: splashScreen,
        );
      },
    );
  }
}
