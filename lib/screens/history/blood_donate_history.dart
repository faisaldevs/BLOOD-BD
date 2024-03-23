import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/user_history_controller.dart';
import '../../models/blood_donate_history_model.dart';

class HistoryDonate extends StatelessWidget {
  HistoryDonate({super.key});

  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<BloodDonateHistory>>(
        future: controller.getHistoryDonate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // List dataList = snapshot.data as List;
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                BloodDonateHistory e = snapshot.data![index];
                String contactPersonName = e.contactPersonName ?? "name";
                String number = e.contactPersonPhone ?? "01*********";
                // String patientsName = e.patientsName ?? "Patient Name";
                String healthIssue = e.healthIssue ?? "Health Issue";
                String bloodAmount = e.amountBag ?? "Blood Amount";
                String bloodType = e.bloodGroup ?? "Type";
                // String date = e.date ?? "date";
                // String time = e.time ?? "time";
                String address = e.address ?? "address";
                // String note = e.note ?? "note";
                return HistoryTile(
                    contactPersonName,
                    number,
                    // patientsName,
                    healthIssue,
                    bloodAmount,
                    bloodType,
                    // date,
                    // time,
                    address,
                    // note
                );
                // );
              },);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget HistoryTile(String contactPersonName,
      String number,
      // String patientsName,
      String healthIssue,
      String bloodAmount,
      String bloodType,
      String address,
      // String time,
      // String date,
      // String note,
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
    var value = controller.isVisible.value;

    print(value);

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
                          contactPersonName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          showTime(),
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    Text("Number : $number",
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
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
                    const Text("Patient's Name : patientsName",
                        style: TextStyle(
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
                        controller.visibility();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: controller.isVisible.value
                            ? const Row(
                          children: [
                            Icon(
                              CupertinoIcons.chevron_up,
                              size: 16,
                            ),
                            Text("Show less")
                          ],
                        )
                            : const Row(
                          children: [
                            Icon(
                              CupertinoIcons.chevron_down,
                              size: 16,
                            ),
                            Text("Show more")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Obx(() =>
              Visibility(
                visible: controller.isVisible.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Address : $address"),
                        // Text("Date & Time : $date$time"),
                      ],
                    ),
                    Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Contact Person's Name : $contactPersonName"),
                        Text("Contact Person's Number : $number"),
                      ],
                    ),
                    Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text("Massage : $note"),
                        // Text(
                        //     "dew   wwe 0eew dogie  eu ihhjfiew site heo h wo "),
                      ],
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         // sdStorageClear();
          //       },
          //       style: ButtonStyle(
          //         backgroundColor:
          //             const MaterialStatePropertyAll<Color>(Colors.red),
          //         padding: const MaterialStatePropertyAll(
          //             EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
          //         shape: MaterialStatePropertyAll(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(5.0),
          //           ),
          //         ),
          //       ),
          //       child: const Text(
          //         "Call",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //     const SizedBox(width: 20),
          //     ElevatedButton(
          //       onPressed: () {},
          //       style: ButtonStyle(
          //         backgroundColor:
          //             const MaterialStatePropertyAll<Color>(Color(0xff026b49)),
          //         padding: const MaterialStatePropertyAll(
          //             EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
          //         shape: MaterialStatePropertyAll(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(5.0),
          //           ),
          //         ),
          //       ),
          //       child: const Text(
          //         "I'm Interested",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

}
