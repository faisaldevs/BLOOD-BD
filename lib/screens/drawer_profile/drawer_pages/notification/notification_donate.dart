import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../controllers/donation_status_controller.dart';
import '../../../../models/donation_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../global_widget/description_ui.dart';


class NotificationDonate extends StatelessWidget {
   NotificationDonate({super.key});

  final DonationStatusController controller =
  Get.put(DonationStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.redAccent,
      //     statusBarIconBrightness: Brightness.dark,
      //     // For Android (dark icons)
      //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
      //   ),
      //   title: const Text("Donation Request"),
      //   titleSpacing: 0,
      //   backgroundColor: AppTheme.primary,
      //   surfaceTintColor: Colors.transparent,
      //   foregroundColor: AppTheme.textColorRed,
      //   elevation: 0,
      //   leading: InkWell(
      //     onTap: () => Get.back(),
      //     child: const Icon(
      //       Icons.arrow_back_ios,
      //     ),
      //   ),
      // ),
      body: FutureBuilder<DonationModel>(
        future: controller.getDonationList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.data?.length,
              itemBuilder: (context, index) {
                final e = dataList.data?[index];

                String contactPersonName =
                    e?.bloodRequest?.contactPersonName ?? "";
                String contractPersonNumber =
                    e?.bloodRequest?.contactPersonPhone.toString() ?? "";
                String patientsName = e?.bloodRequest?.patientsName ?? "";
                String healthIssue = e?.bloodRequest?.healthIssue ?? "";
                String bloodAmount =
                    e?.bloodRequest?.amountBag.toString() ?? "";
                String bloodType = e?.bloodRequest?.bloodGroup ?? "";
                String address = e?.bloodRequest?.address ?? "";
                String time = e?.bloodRequest?.time ?? "";
                String date = e?.bloodRequest?.date ?? "";
                String note = e?.bloodRequest?.note ?? "";

                return donationTile(
                    contactPersonName,
                    contractPersonNumber,
                    patientsName,
                    healthIssue,
                    bloodAmount,
                    bloodType,
                    address,
                    time,
                    date,
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
                    "No Notification Found!",
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

  Widget donationTile(
      String contactPersonName,
      String contractPersonNumber,
      String patientsName,
      String healthIssue,
      String bloodAmount,
      String bloodType,
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
      width: Get.width.w,
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
                        Text(
                          showTime(),
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    Text("Number : $contractPersonNumber",
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
                    Text("Patient's Name : $patientsName",
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                    Text("Health Issue : $healthIssue",
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                    Text(
                      "Blood Required : $bloodAmount",
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
                        // controller.visibility();
                        Get.to(
                          DescriptionUi(
                            contractPersonName: contactPersonName,
                            contractPersonNumber: contractPersonNumber,
                            patientName: patientsName,
                            healthIssue: healthIssue,
                            bloodAmount: bloodAmount,
                            bloodType: bloodType,
                            address: address,
                            date: date,
                            time: time,
                            note: note,
                            title: 'Donation Request List',
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 6),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Text(
                          "See More",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                  launchUrlString("tel:$contractPersonNumber");
                },
                style: ButtonStyle(
                  backgroundColor:
                  const WidgetStatePropertyAll<Color>(Colors.red),
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                  shape: WidgetStatePropertyAll(
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
                  Get.rawSnackbar(
                      messageText: const Text('Currently working on it..!!',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      isDismissible: true,
                      duration: const Duration(seconds: 3),
                      backgroundColor: Colors.red[400]!,
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 35,
                      ),
                      margin: EdgeInsets.zero,
                      snackStyle: SnackStyle.GROUNDED);
                },
                style: ButtonStyle(
                  backgroundColor:
                  const WidgetStatePropertyAll<Color>(Color(0xff026b49)),
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Message",
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
