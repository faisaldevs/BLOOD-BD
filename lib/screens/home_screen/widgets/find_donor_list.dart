import 'package:blood_bd/screens/blood_request_donor/add_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../controllers/find_donor_controller.dart';
import '../../global_widget/description_ui.dart';

class FindDonorListPage extends StatelessWidget {
  FindDonorListPage(
      {super.key,
      required this.bloodType,
      required this.division,
      required this.district});

  final String bloodType;
  final String division;
  final String district;

  final cnt = Get.put(FindDonorController());

  @override
  Widget build(BuildContext context) {
    print(bloodType);
    print(division);
    print(district);

    return Scaffold(
      appBar:      AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: const Text("Donor List"),
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),

      ),
      body: FutureBuilder(
        future: cnt.getFindDonor(bloodType, division, district),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.data?.length,
              itemBuilder: (context, index) {
                final e = dataList.data?[index];
                String donorId = e?.id.toString() ?? "donorId";
                String name = e?.user?.name ?? "name";
                String contactPersonName = e?.contactPersonName ?? "name";
                String number = e?.contactPersonPhone ?? "01*********";
                String healthIssue = e?.healthIssue ?? "Health Issue";
                String bloodAmount = e?.amountBag ?? "Blood Amount";
                String bloodType = e?.bloodGroup ?? "Type";
                String address = e?.address ?? "address";
                String lastDonateDate =
                    e?.lastDonateDate ?? "Not Donated Yet..";
                String division = e?.division ?? "address";
                String district = e?.district ?? "address";
                print(number);

                return donorId == "donorId" ?  SizedBox(
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
                ):historyTile(
                    donorId,
                    name,
                    contactPersonName,
                    number,
                    healthIssue,
                    bloodAmount,
                    bloodType,
                    address,
                    lastDonateDate,
                    division,
                    district);
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
    String donorId,
    String name,
    String contactPersonName,
    String number,
    String healthIssue,
    String bloodAmount,
    String bloodType,
    String address,
    String lastDonateDate,
    String division,
    String district,
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
                    Text("Donor Name : $name",
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
                        Get.to(DescriptionUi(
                          contractPersonName: contactPersonName,
                          contractPersonNumber: number,
                          lastDonateDate: lastDonateDate,
                          healthIssue: healthIssue,
                          bloodAmount: bloodAmount,
                          bloodType: bloodType,
                          address: address,
                          division: division,
                          district: district,
                          id: donorId,
                          // date: date,
                          // time: time,
                          // note: note,
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
                onPressed: () {
                  Get.to(RequestBlood(donorId: donorId));
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
                  "Request",
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
