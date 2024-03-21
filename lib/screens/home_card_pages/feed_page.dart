import 'dart:math';

import 'package:blood_bd/data_list/data_list.dart';
import 'package:blood_bd/screens/home_card_pages/feed/feed_dropdown.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/blood_request_controller.dart';
import '../../models/blood_request_model.dart';
import 'feed/feed_donor_request.dart';
import 'feed/feed_receiver_request.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  BloodRequestController controller = Get.put(BloodRequestController());

  // final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    // var contactParsonPhone = getStorage.read("contactParsonPhone");
    // bool hasData = contactParsonPhone != null;

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     backgroundColor: AppTheme.primary,
    //     appBar: AppBar(
    //
    //       systemOverlayStyle: const SystemUiOverlayStyle(
    //         statusBarColor: Colors.redAccent,
    //         statusBarIconBrightness: Brightness.dark,
    //         statusBarBrightness: Brightness.light,
    //       ),
    //       title: const Text("Blood Request",style: TextStyle(color: Colors.white),),
    //       centerTitle: true,
    //       titleSpacing: 0,
    //       backgroundColor: AppTheme.primaryRed,
    //       surfaceTintColor: Colors.transparent,
    //       elevation: 0,
    //       leading: null,
    //     ),
    //     body: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
    //       child: Column(
    //         children: [
    //
    //           Expanded(
    //             child: Column(
    //               children: [
    //                 const TabBar(
    //                     labelColor: Colors.redAccent,
    //                     indicatorColor: Colors.redAccent,
    //                     indicatorSize: TabBarIndicatorSize.tab,
    //                     indicatorWeight: 3,
    //                     tabs: [
    //                       Tab(
    //                         text: "Donor",
    //                       ),
    //                       Tab(
    //                         text: "Receiver",
    //                       ),
    //                     ]),
    //                 SizedBox(
    //                   height: Get.height * .02,
    //                 ),
    //                 FeedDropdown(
    //                     dropDownList: DataList.bloodListData,
    //                     label: "Select Blood Type",
    //                     onChanged: (value) {}),
    //                 SizedBox(
    //                   height: Get.height * .01,
    //                 ),
    //                  const Expanded(
    //                   child: TabBarView(
    //                     children: [
    //                       DonorRequestFeed(),
    //                       ReceiverRequestFeed(),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: FutureBuilder<List<RequestBloodModel>>(
        future: controller.getRequestData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // List dataList = snapshot.data as List;
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                RequestBloodModel e = snapshot.data![index];
              return ListTile(
                title: Text(e.patientsName.toString()),
              );
            },);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
          return Text("data");
        },
      ),
    );
  }
}
