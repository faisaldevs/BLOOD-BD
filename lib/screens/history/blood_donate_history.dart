import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/user_history_controller.dart';
import '../../models/blood_donate_history_model.dart';
import '../../utils/app_colors.dart';

class HistoryDonate extends StatelessWidget {
  HistoryDonate({super.key});

  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BloodDonateHistoryModel>(
        future: controller.getHistoryDonate(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // if (snapshot.hasError) {
          //   // return const Center(child: Text("Something went wrong"),);
          //   return const Center(
          //     child: Text("Coming Soon..!!"),
          //   );
          // }

          if (snapshot.hasData) {
            // List dataList = snapshot.data as List;
            return ListView.builder(
              itemCount: snapshot.data?.data?.length,
              itemBuilder: (context, index) {
                final e = snapshot.data?.data?[index];

                String cpNumber = e?.bloodRequest?.contactPersonPhone ?? "Type";
                String cpName = e?.bloodRequest?.contactPersonName ?? "Type";
                String patientsName =
                    e?.bloodRequest?.patientsName ?? "Patient Name";
                String healthIssue =
                    e?.bloodRequest?.healthIssue ?? "Health Issue";
                String bloodAmount =
                    e?.bloodRequest?.amountBag.toString() ?? "Blood Amount";
                String bloodType = e?.bloodRequest?.bloodGroup ?? "Type";

                String date = e?.bloodRequest?.date ?? "Type";
                String time = e?.bloodRequest?.time ?? "Type";
                String myStatus = e?.receiverStatus ?? "Type";
                String senderStatus = e?.senderStatus ?? "Type";
                // String dateText = e?.date ?? "date";
                // String? date = dateConverter(dateText);
                //
                // String timeText = e?.time ?? "time";
                // String? time = timeConverter(timeText);
                // String address = e?.address ?? "address";
                // String note = e?.note ?? "note";

                return historyTile(
                  cpNumber,
                  cpName,
                  patientsName,
                  healthIssue,
                  bloodAmount,
                  bloodType,

                  time,
                  date,
                  myStatus,
                  senderStatus,
                );
                // );
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
        },
      ),
    );
  }

  Widget historyTile(
      String cpNumber,
      String cpName,
    String patientsName,
    String healthIssue,
    String bloodAmount,
    String bloodType,

    String time,
    String date,
    String myStatus,
    String senderStatus,
  ) {
    String showTime() {
      DateTime now;

      now = DateTime.now();

      String formattedDate = DateFormat('dd MMM, kk:mm a').format(now);

      return formattedDate;
    }

    // bool isVisible = false;
    //
    // visibility(){
    //   isVisible = !isVisible;
    //   print(isVisible);
    // }
    // var value = controller.isVisible.value;
    //
    // if (kDebugMode) {
    //   print(value);
    // }

    return Container(
        color: AppTheme.primary,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
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
                Container(
                  width: Get.width * .775,
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
                            cpName,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$date $time",
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Number : $cpNumber",
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          Text("$myStatus",
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold,color: Colors.green)),
                        ],
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
                      const SizedBox(height: 5),
                      // InkWell(
                      //   borderRadius: BorderRadius.circular(10),
                      //   onTap: () {
                      //     // Get.to(HistoryDescription(
                      //     //   title: 'History',
                      //     //   id: '',
                      //     //   hospitalName: '',
                      //     //   contractPersonName: '',
                      //     //   contractPersonNumber: '',
                      //     //   patientName: '',
                      //     //   healthIssue: '',
                      //     //   bloodAmount: '',
                      //     //   bloodType: '',
                      //     //   address: '',
                      //     //   date: '',
                      //     //   lastDonateDate: '',
                      //     //   division: '',
                      //     //   district: '',
                      //     //   note: '',
                      //     //   thana: '',
                      //     //   time: '',
                      //     //   receiverStatus: '',
                      //     //   notificationId: '', buttonText: '',
                      //     // ));
                      //     print("object");
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.all(4),
                      //     decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(10)),
                      //     ),
                      //     child: const Text("Show more"),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 10),
          ],
        ),
      );
    }
  }
