import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DescriptionUI extends StatelessWidget {
  DescriptionUI({
    super.key,
    required this.contactPersonName,
    required this.contractPersonNumber,
    required this.receiverStatus,
    required this.name,
    required this.healthIssue,
    required this.bloodAmount,
    required this.bloodType,
    required this.lastDonateDate,
    required this.division,
    required this.district,
    required this.thana,
    required this.address,
    required this.notificationId, this.buttonFunction1, this.buttonFunction2,
  });

  final String contactPersonName;
  final String contractPersonNumber;
  final String receiverStatus;
  final String name;
  final String healthIssue;
  final String bloodAmount;
  final String lastDonateDate;
  final String bloodType;
  final String division;
  final String district;
  final String thana;
  final String address;
  final String notificationId;
  final Function()? buttonFunction1;
  final Function()? buttonFunction2;

  @override
  Widget build(BuildContext context) {
    String showTime() {
      DateTime now;

      now = DateTime.now();

      String formattedDate = DateFormat('dd MMM, kk:mm a').format(now);

      return formattedDate;
    }

    print(notificationId);
    print(receiverStatus);

    return Scaffold(
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
        title: Text("Request Status"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: Get.height,
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
                              "Name : $contactPersonName",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   date!,
                            //   style: const TextStyle(
                            //     color: Colors.green,
                            //   ),
                            // )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Number : $contractPersonNumber",
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: receiverStatus == "Pending"
                                  ? Text(
                                "Pending",
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              )
                                  : receiverStatus == "Accepted"
                                  ? Text(
                                "Accepted",
                                style: const TextStyle(
                                  color: Colors.green,
                                ),
                              )
                                  : Text(
                                "Canceled",
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
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
                        Text("Patient's Name : $name",
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
                        Text(
                          "Last Donate Date : $lastDonateDate",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                          child: Text(
                            "$bloodType",
                            // dataList[index]["patient_name"],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Division : $division"),
                      Text("District : $district"),
                      // Text("Thana : $"),
                      Text("Address : $address"),
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Contact Person's Name : $contactPersonName"),
                      Text("Contact Person's Number : $contractPersonNumber"),
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text("Massage : $note"),
                    ],
                  ),
                ],
              ),
              Divider(),
              const SizedBox(height: 10),
              Text(
                "Your Status Will Update in Next Refresh ..!!",
                style: TextStyle(color: Colors.red),
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      launchUrlString("tel:$contractPersonNumber");
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Colors.blueGrey),
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
                    onPressed: buttonFunction1,
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
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: buttonFunction2,
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Color(0xff026b49)),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Accept",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}