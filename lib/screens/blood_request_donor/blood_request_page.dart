import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../controllers/blood_request_controller.dart';
import '../../models/blood_request_model.dart';
import 'blood_request_discription.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final BloodRequestController controller = Get.put(BloodRequestController());

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
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: const Text("Blood Request"),
      ),
      body: FutureBuilder<RequestBloodModel>(
          future: controller.getRequestData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong..!!"));
            }

            if (snapshot.hasData) {
              final dataList = snapshot.data!;
              return ListView.builder(
                itemCount: snapshot.data?.data?.length,
                itemBuilder: (context, index) {
                  final e = dataList.data?[index];
                  String requestId = e?.id.toString() ?? "name";
                  String requestUserId = e?.user?.id.toString() ?? "name";
                  String contactPersonName = e?.contactPersonName ?? "name";
                  String number = e?.contactPersonPhone ?? "01*********";
                  String patientsName = e?.patientsName ?? "Patient Name";
                  String healthIssue = e?.healthIssue ?? "Health Issue";
                  String bloodAmount = e?.amountBag.toString() ?? "Blood Amount";
                  String bloodType = e?.bloodGroup ?? "Type";
                  String date = e?.date ?? "date";
                  String time = e?.time ?? "time";
                  String address = e?.address ?? "address";
                  String division = e?.division ?? "address";
                  String district = e?.district ?? "address";
                  String thana = e?.upazila ?? "address";
                  String hospitalName = e?.hospitalName ?? "address";
                  String note = e?.note ?? "note";

                  return historyTile(
                      requestId,
                      requestUserId,
                      contactPersonName,
                      number,
                      patientsName,
                      healthIssue,
                      bloodAmount,
                      bloodType,
                      date,
                      time,
                      address,
                      division,
                      district,
                      thana,
                      hospitalName,
                      note);
                },
              );
            } else {
              return SizedBox(
                height: Get.height,
                width: Get.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: 80,
                      color: Colors.black26,
                    ),
                    Text(
                      "No Data Found!",
                      style: TextStyle(fontSize: 19, color: Colors.black26),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Widget historyTile(
    String requestId,
    String requestUserId,
    String contactPersonName,
    String number,
    String patientsName,
    String healthIssue,
    String bloodAmount,
    String bloodType,
      String   division,
      String district,
      String thana,
      String hospitalName,
    String address,
    String time,
    String date,
    String note,
  ) {
    String showTime() {
      DateTime now;

      now = DateTime.now();

      String formattedDate = DateFormat('dd MMM, kk:mm a').format(now);

      return formattedDate;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      width: Get.width,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: Get.width * .1,
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
              // SizedBox(width: 10,),
              Container(
                width: Get.width * 1.w,
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          contactPersonName,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          showTime(),
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Number : $number",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Patient's Name : $patientsName",
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                    Text("Health Issue : $healthIssue",
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                    Text("Blood Required : $bloodAmount",
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Text(
                        bloodType,
                        // dataList[index]["patient_name"],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Get.to(RequestDescriptionUi(
                          contractPersonName: contactPersonName,
                          contractPersonNumber: number,
                          patientName: patientsName,
                          healthIssue: healthIssue,
                          bloodAmount: bloodAmount,
                          bloodType: bloodType,
                          division: division,
                          district: district,
                          thana: thana,
                          hospitalName: hospitalName,
                          address: address,
                          date: date,
                          time: time,
                          note: note, title: 'Blood Request',
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Text("Show more"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  launchUrlString("tel:$number");
                },
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.red),
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Call",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: (){
                  print("clicked");
                  controller.donateBlood(requestId,bloodAmount,requestUserId);

                  // Get.rawSnackbar(
                  //     messageText: const Text(
                  //         'Currently working on it..!!',
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 14
                  //         )
                  //     ),
                  //     isDismissible: true,
                  //     duration: const Duration(seconds: 3),
                  //     backgroundColor: Colors.red[400]!,
                  //     icon : const Icon(Icons.settings, color: Colors.white, size: 35,),
                  //     margin: EdgeInsets.zero,
                  //     snackStyle: SnackStyle.GROUNDED
                  // );
                },
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Color(0xff026b49)),
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Donate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
