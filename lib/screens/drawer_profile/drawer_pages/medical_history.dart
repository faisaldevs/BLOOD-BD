import 'package:blood_bd/screens/global_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_colors.dart';

class MedicalHistory extends StatelessWidget {
  MedicalHistory({super.key});

  final List<Map<String, dynamic>> mhList =
      (GetStorage().read('mhList') as List<dynamic>?)
              ?.cast<Map<String, dynamic>>() ??
          [];

  @override
  Widget build(BuildContext context) {
    print(mhList.toString());

    String showTime() {
      DateTime now;

      now = DateTime.now();

      String formattedDate = DateFormat('dd MMM yy').format(now);

      return formattedDate;
    }

    return Scaffold(backgroundColor: AppTheme.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text("Medical History"),
        titleSpacing: 0,
        backgroundColor: AppTheme.primary,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppTheme.textColorRed,        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            GetStorage().remove("mhList");
          }, icon: const Icon(Icons.clear)),
        ],
      ),
      body: ListView.builder(
        itemCount: mhList.length,
        itemBuilder: (context, index) {
          // Map<String, dynamic> medHistory = mhList[index];

          // print("2nd Data :$medicalHistory");

          return Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(10),
                  width: Get.width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width * .1,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Blood Test",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      showTime(),
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            mhList[index]["institutionName"]
                                                .toString(),
                                            // "Dhaka Medical College",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.teal[400],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          border: Border.all(
                                              width: 1, color: Colors.cyan),
                                        ),
                                        child: const Text(
                                          "Confirmed",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View Details",
                      style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline),
                    )),
                const Divider(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
          width: Get.width,
          margin: const EdgeInsets.all(16),
          child: CustomButton(
            onPressed: () {
              Get.toNamed(newReport);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Add New Report",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          )),
    );
  }
}

//hemoglobin.toString().isEmpty? SizedBox(
//         height: Get.height,
//         width: Get.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.search,
//               size: 80,
//               color: Colors.black26,
//             ),
//             const Text(
//               "No Notification Found!",
//               style: TextStyle(fontSize: 19, color: Colors.black26),
//             ),
//             SizedBox(
//               height: Get.height * .32,
//             ),
//             // Container(
//             //     width: Get.width,
//             //     margin: const EdgeInsets.all(16),
//             //     child: CustomButton(
//             //       onPressed: () {
//             //         Get.toNamed(newReport);
//             //       },
//             //       child: const Row(
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: [
//             //           Icon(
//             //             Icons.add,
//             //             color: Colors.white,
//             //           ),
//             //           SizedBox(
//             //             width: 4,
//             //           ),
//             //           Text(
//             //             "Add New Report",
//             //             style: TextStyle(color: Colors.white, fontSize: 16),
//             //           ),
//             //         ],
//             //       ),
//             //     )),
//           ],
//         ),
//       ) :
