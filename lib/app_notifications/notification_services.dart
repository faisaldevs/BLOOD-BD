import 'package:blood_bd/screens/drawer_profile/drawer_pages/donation_status.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';


class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  void initLocalNotification(BuildContext context,RemoteMessage message) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
        print("object");

        handleMessage(context, message);
      },
    );
  }

  firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification?.title.toString());
      print(message.notification?.body.toString());
      print(message.data.toString());
      print(message.data["type"].toString());
      print(message.data["healthIssue"].toString());
      // String healthIssue = ;
      // String bloodType = message.data["bloodType"];
      // String bloodAmount = message.data["bloodAmount"];
      // String date = message.data["date"];
      // String hospitalName = message.data["hospitalName"];
      // String number = message.data["phone"];
      // String name = message.data["name"];


      initLocalNotification(context, message);
      showMessage(message);
    });
  }

  Future<void>showMessage(RemoteMessage message)async{

    String? healthIssue = message.data["healthIssue"];
    String? bloodType = message.data["bloodType"];
    String? bloodAmount = message.data["bloodAmount"];
    String? date = message.data["date"];
    String? hospitalName = message.data["hospitalName"];
    String? number = message.data["phone"];
    String? name = message.data["name"];

    print(hospitalName);

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: BigTextStyleInformation(
          '''🩸জরুরী রক্ত প্রয়োজন🩸\b
        💁 রোগীর সমস্যা: $healthIssue\b
      🔴 রক্তের গ্রুপঃ $bloodType\b
      💉 রক্তের পরিমাণঃ $bloodAmount  beg.\b
      🗓️ তারিখঃ $date\b
      🏥 রক্তদানের স্থান: $hospitalName\b
      ☎️ যোগাযোগ : $number ($name)''',
      ),
    );
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title.toString(),
      // 'You have a new message!',
      '''🩸জরুরী রক্ত প্রয়োজন🩸\b
        💁 রোগীর সমস্যা: ক্যান্সার\b
      🔴 রক্তের গ্রুপঃ A+ positive\b
      💉 রক্তের পরিমাণঃ 1 beg.\b
      🗓️ তারিখঃ আগামীকাল সকাল\b
      🏥 রক্তদানের স্থান: মিরপুর ডেলটা হাসপাতাল\b
      ☎️ যোগাযোগ : 01521-376288 (Radid)''',
      platformChannelSpecifics,
      payload: 'type',
    );
  }



  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      announcement: true,
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
      criticalAlert: true,
      carPlay: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user permission granted");



    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user provisional permission granted");
    } else {
      print("user permission declined");
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print("refresh");
    });
  }
void handleMessage(BuildContext context,RemoteMessage message){

    if(message.data["type"] == "blood_request"){
      Get.to(DonationStatus());
    }

}




}
