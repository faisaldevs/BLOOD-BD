import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import 'blood_donate_history.dart';
import 'blood_request_history.dart';

class BloodHistory extends StatelessWidget {
  const BloodHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.primary,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.redAccent,

            statusBarIconBrightness: Brightness.dark,

            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: const Text("History"),
          titleSpacing: 0,
          backgroundColor: AppTheme.primary,
          surfaceTintColor: Colors.transparent,
          foregroundColor: AppTheme.textColorRed,
          elevation: 0,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              // color: Colors.=,
            ),
          ),
          bottom: const TabBar(
              labelColor: Colors.green,
              indicatorColor: Colors.green,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: "Blood Request",
                ),
                Tab(
                  text: "Blood Donate",
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            const HistoryRequest(),
            // FutureBuilder<List<BloodRequestHistoryModel>>(
            //   future: controller.getHistoryRequest(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       // List dataList = snapshot.data as List;
            //       return ListView.builder(
            //         itemCount: snapshot.data?.length,
            //         itemBuilder: (context, index) {
            //           BloodRequestHistoryModel e = snapshot.data![index];
            //           return ListTile(
            //             title: Text(e.patientsName.toString()),
            //           );
            //         },);
            //     } else {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //     return Text("data");
            //   },
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.search,
            //       size: 80,
            //       color: Colors.black26,
            //     ),
            //     Text(
            //       "No Notification Found!",
            //       style: TextStyle(fontSize: 18, color: Colors.black26),
            //     ),
            //   ],
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.search,
            //       size: 80,
            //       color: Colors.black26,
            //     ),
            //     Text(
            //       "No Notification Found!",
            //       style: TextStyle(fontSize: 18, color: Colors.black26),
            //     ),
            //   ],
            // ),
            HistoryDonate(),
          ],
        ),
      ),
    );
  }
}
