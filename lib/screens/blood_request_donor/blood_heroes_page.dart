import 'package:blood_bd/models/blood_bank_model.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../controllers/blood_bank_controller.dart';

class BloodHeroes extends StatelessWidget {
  BloodHeroes({super.key});

  final BloodBankController controller = Get.put(BloodBankController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryRed,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        title: const Text("Blood Bank"),
        foregroundColor: AppTheme.primary,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: FutureBuilder(
        future: controller.getBloodBankData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            if (kDebugMode) {
              print("success");
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                BloodBankModel e = snapshot.data![index];
                // String id = e.id.toString() ?? "id";
                String number = e.phones ?? "01*********";
                number = number
                    .replaceAll('[', '')
                    .replaceAll(']', '')
                    .replaceAll('\\', '')
                    .replaceAll('"', '');
                List<String> dataList = number.split(', ');
                String phone1 = dataList[0];
                String phone2 = dataList[1];
                String phone3 = dataList[2];
                // String clubName = e.clubName ?? "Club Name";
                String name = e.contactPerson ?? "Contact Person";
                // String division = e.division ?? "Division";
                // String district = e.district ?? "District";
                // String upazilla = e.upazila ?? "Upazilla";
                // String union = e.union ?? "Union";
                String address = e.address ?? "address";

                return Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 4, top: 8),
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        address,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 0),
                        child: Text(
                          "contract :",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    launchUrlString("tel:$phone1");
                                  },
                                  icon: Row(
                                    children: [
                                      const Icon(
                                        Icons.call,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        phone1,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                IconButton(
                                  onPressed: () {
                                    launchUrlString("tel:$phone2");
                                  },
                                  style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(0))),
                                  icon: Row(
                                    children: [
                                      const Icon(
                                        Icons.call,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        phone2,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                IconButton(
                                  onPressed: () {
                                    launchUrlString("tel:$phone3");
                                  },
                                  style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(0))),
                                  icon: Row(
                                    children: [
                                      const Icon(
                                        Icons.call,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        phone3,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
}
