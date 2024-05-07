import 'package:blood_bd/screens/drawer_profile/drawer_pages/notification/notification_donate.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'notification/notification_request.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // String showTime() {
    //   DateTime now;
    //
    //   now = DateTime.now();
    //
    //   String formattedDate = DateFormat('dd MMM, kk:mm a').format(now);
    //
    //   return formattedDate;
    // }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.primary,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.redAccent,
            statusBarIconBrightness: Brightness.dark,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: const Text("Notification"),
          titleSpacing: 0,
          backgroundColor: AppTheme.primary,
          surfaceTintColor: Colors.transparent,
          foregroundColor: AppTheme.textColorRed,
          elevation: 0,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              // color: Colors.black,
            ),
          ),
          bottom: const TabBar(
              labelColor: Colors.green,
              indicatorColor: Colors.green,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: "Request",
                ),
                Tab(
                  text: "Donate",
                ),
              ]),
        ),
        body:  TabBarView(
          children: [
            NotificationRequest(),
            // const Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.search,
            //       size: 120,
            //       color: Colors.black26,
            //     ),
            //     Text(
            //       "No Notification Found!",
            //       style: TextStyle(fontSize: 24, color: Colors.black26),
            //     ),
            //   ],
            // ),

            NotificationDonate(),
            // BloodRqNotification(),
            // const Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.search,
            //       size: 120,
            //       color: Colors.black26,
            //     ),
            //     Text(
            //       "No Notification Found!",
            //       style: TextStyle(fontSize: 24, color: Colors.black26),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
