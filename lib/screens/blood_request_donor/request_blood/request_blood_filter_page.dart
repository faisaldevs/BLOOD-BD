import 'package:blood_bd/models/search_requested_donor.dart';
import 'package:blood_bd/screens/global_widget/description_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/request_blood_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';

class FilterPage extends StatelessWidget {
  FilterPage(
      {super.key,
      required this.bloodRequestId,
      required this.bloodType,
      required this.division,
      required this.district,
      required this.bloodAmount,
       this.healthIssue,
       this.name,
       this.date,
       this.hospitalName,
       this.phone});

  final String bloodRequestId;
  final String bloodType;
  final String bloodAmount;
  final String division;
  final String district;
  final String? healthIssue;
  final String? name;
  final String? date;
  final String? hospitalName;
  final String? phone;

  final RequestBloodController controller = Get.put(RequestBloodController());

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Donor List"),
        // leading: InkWell(
        //   onTap: () => Get.offAllNamed(home),
        //   child: const Icon(
        //     Icons.arrow_back_ios,
        //   ),
        // ),
      ),
      body: FutureBuilder<DonorSearch>(
        future: controller.donorSearch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: snapshot.data?.data?.length,
              itemBuilder: (context, index) {
                final e = dataList.data?[index];
                String bloodDonorId = e?.id.toString() ?? "";
                String bloodDonorUserId = e?.user?.id.toString() ?? "";
                String contactPersonName = e?.contactPersonName ?? "name";
                String number =
                    e?.contactPersonPhone.toString() ?? "01*********";
                String healthIssue = e?.healthIssue ?? "Health Issue";
                String bloodAmount = e?.amountBag.toString() ?? "Blood Amount";
                String bloodType = e?.bloodGroup ?? "Type";

                String address = e?.address ?? "address";
                String deviceToken = e?.user?.deviceToken ?? "Device token";

                return historyTile(
                  bloodDonorId,
                  bloodDonorUserId,
                  contactPersonName,
                  number,
                  healthIssue,
                  bloodAmount,
                  bloodType,
                  address,
                  deviceToken,
                );
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
                    "No Donate List Found!",
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
    String bloodDonorId,
    String bloodDonorUserId,
    String contactPersonName,
    String contactPersonNumber,
    String healthIssue,
    String bloodAmount,
    String bloodType,
    String address,
    String deviceToken,
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

    // print(value);

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
                    Text("Number : $contactPersonNumber",
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
                    const Text("Patient's Name : ",
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
                        // Get.to(DescriptionUi(
                        //   contractPersonName: contactPersonName,
                        //   contractPersonNumber: contactPersonNumber,
                        //   patientName: contactPersonName,
                        //   healthIssue: healthIssue,
                        //   bloodAmount: bloodAmount,
                        //   bloodType: bloodType,
                        //   address: address,
                        // ));
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
                onPressed: () async {},
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
                onPressed: () {
                  print("1122");
                  controller.confirmBlood(
                      bloodRequestId,
                      bloodDonorId,
                      bloodAmount,
                      bloodDonorUserId,
                      deviceToken,
                      healthIssue,
                      name,
                      date,
                      hospitalName,
                      phone,
                      bloodType);
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
                  "Confirm",
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
