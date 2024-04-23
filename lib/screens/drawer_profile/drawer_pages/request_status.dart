import 'package:blood_bd/screens/drawer_profile/drawer_pages/request_status_description_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../controllers/request_status_controller.dart';
import '../../../models/request_status_model.dart';
import '../../../utils/app_colors.dart';


class RequestStatus extends StatelessWidget {
  RequestStatus({super.key});

  final RequestStatusController controller = Get.put(RequestStatusController());


  loadingBar() => Get.rawSnackbar(
      messageText: const Text('Loading..!!',
          style: TextStyle(color: Colors.white, fontSize: 14)),
      isDismissible: true,
      duration: const Duration(milliseconds: 800),
      backgroundColor: Colors.red[400]!,
      icon: const Icon(
        Icons.settings,
        color: Colors.white,
        size: 35,
      ),
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text("Request Status"),
        titleSpacing: 0,
        backgroundColor: AppTheme.primary,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppTheme.textColorRed,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Your Status Will Update in Next Refresh ..!!",
            style: TextStyle(color: Colors.red),
          ),
          Divider(),
          Expanded(
            child: FutureBuilder<RequestStatusModel>(
              future: controller.getDonationList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                // if(snapshot.hasError){
                //   return const Center(child: Text("Something went wrong"),);
                // }
                if (snapshot.hasData) {
                  final dataList = snapshot.data!;
                  return ListView.builder(
                    itemCount: dataList.data?.length,
                    itemBuilder: (context, index) {
                      final e = dataList.data?[index];
                      String notificationId = e?.id.toString() ?? "";
                      String name = e?.user?.name.toString() ?? "";
                      String bloodType = e?.bloodDonor?.bloodGroup ?? "";
                      String bloodAmount =
                          e?.bloodDonor?.amountBag.toString() ?? "";
                      String healthIssue = e?.bloodDonor?.healthIssue ?? "";
                      String lastDonateDate =
                          e?.bloodDonor?.lastDonateDate ?? "";
                      String address = e?.bloodDonor?.address ?? "";
                      String division = e?.bloodDonor?.division ?? "";
                      String district = e?.bloodDonor?.district ?? "";
                      String thana = e?.bloodDonor?.upazila ?? "";
                      String receiverStatus = e?.receiverStatus ?? "";
                      String contactPersonName =
                          e?.bloodDonor?.contactPersonName ?? "";
                      String contractPersonNumber =
                          e?.bloodDonor?.contactPersonPhone.toString() ?? "";

                      return donationTile(
                        notificationId,
                        name,
                        healthIssue,
                        bloodAmount,
                        bloodType,
                        address,
                        division,
                        district,
                        thana,
                        receiverStatus,
                        lastDonateDate,
                        contactPersonName,
                        contractPersonNumber,
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
                          "No Donation Request Found!",
                          style: TextStyle(fontSize: 19, color: Colors.black26),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget donationTile(
    String notificationId,
    String name,
    String healthIssue,
    String bloodAmount,
    String bloodType,
    String address,
    String division,
    String district,
    String thana,
    String receiverStatus,
    String lastDonateDate,
    String contactPersonName,
    String contractPersonNumber,
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
                          "Name : $contactPersonName",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   date,
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
                          // DonationDescriptionUi(
                          //   contractPersonName: contactPersonName,
                          //   contractPersonNumber: contractPersonNumber,
                          //   patientName: name,
                          //   healthIssue: healthIssue,
                          //   bloodAmount: bloodAmount,
                          //   bloodType: bloodType,
                          //   address: address,
                          //   division: division,
                          //   district: district,
                          //   notificationId: notificationId,
                          //   receiverStatus: receiverStatus,
                          //   // buttonFunction1: () {
                          //   //   controller.donationStatus(
                          //   //       notificationId, "Canceled");
                          //   //   loadingBar();
                          //   // },
                          //   // buttonFunction2: () {
                          //   //   controller.donationStatus(
                          //   //       notificationId, "Accepted");
                          //   //   loadingBar();
                          //   // },
                          //   title: 'Donation Request List',
                          // ),
                          DescriptionUI(
                            contactPersonName: contactPersonName,
                            contractPersonNumber: contractPersonNumber,
                            receiverStatus: receiverStatus,
                            name: name,
                            healthIssue: healthIssue,
                            bloodAmount: bloodAmount,
                            bloodType: bloodType,
                            lastDonateDate: lastDonateDate,
                            division: division,
                            district: district,
                            thana: thana,
                            address: address,
                            notificationId: notificationId,
                            buttonFunction1: () {
                              controller.donationStatus(
                                  notificationId, "Canceled");
                              loadingBar();
                            },
                            buttonFunction2: () {
                              controller.donationStatus(
                                  notificationId, "Accepted");
                              loadingBar();
                            },
                            // title: 'Donation Request List',
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
                      const MaterialStatePropertyAll<Color>(Colors.blueGrey),
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
                  controller.donationStatus(notificationId, "Canceled");
                  loadingBar();
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
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  controller.donationStatus(notificationId, "Accepted");
                  loadingBar();
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
                  "Accept",
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
