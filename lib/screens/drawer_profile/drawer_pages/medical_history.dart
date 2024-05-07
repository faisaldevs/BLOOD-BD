import 'package:blood_bd/screens/global_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../controllers/medical_hisory_controller.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_colors.dart';

class MedicalHistory extends StatefulWidget {
  MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  final MedicalHistoryController controller =
      Get.put(MedicalHistoryController());

  @override
  Widget build(BuildContext context) {
    // String showTime() {
    //   DateTime now;
    //
    //   now = DateTime.now();
    //
    //   String formattedDate = DateFormat('dd MMM yy').format(now);
    //
    //   return formattedDate;
    // }

    return Scaffold(
      backgroundColor: AppTheme.primary,
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
        foregroundColor: AppTheme.textColorRed,
        elevation: 0,
        // leading: InkWell(
        //   onTap: () => Get.back(),
        //   child: const Icon(
        //     Icons.arrow_back_ios,
        //     // color: Colors.black,
        //   ),
        // ),
        actions: [
          IconButton(onPressed: () {
            setState(() {

            });
          }, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder(
        future: controller.getMedicalHistory(),
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
                String id = e?.id.toString() ?? "";
                String userId = e?.userId.toString() ?? "";
                String instituteName = e?.instituteName.toString() ?? "";
                String dayOfTest = e?.testDate.toString() ?? "";
                String bloodType = e?.bloodGroup.toString() ?? "";
                String bloodPressure = e?.bloodPressure.toString() ?? "";
                String hemoglobin = e?.hemoglobinLevel.toString() ?? "";
                String hepatitis = e?.hepatitis.toString() ?? "";
                String malaria = e?.malaria.toString() ?? "";
                String image = e?.image.toString() ?? "";
                return medicalHistory(
                    id,
                    userId,
                    instituteName,
                    dayOfTest,
                    bloodType,
                    bloodPressure,
                    hemoglobin,
                    hepatitis,
                    malaria,
                    image,);
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

  Widget medicalHistory(
    String id,
    String userId,
    String instituteName,
    String dayOfTest,
    String bloodType,
    String bloodPressure,
    String hemoglobin,
    String hepatitis,
    String malaria,
    String image,
  ) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.textFieldColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      // height: 400,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Institute Name : ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                instituteName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Blood Group : ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    bloodType,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              Text(
                dayOfTest,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Hemoglobin level : ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                hemoglobin,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Blood Pressure : ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ), Text(
                bloodPressure,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Text(
          //   "malaria : ",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Malaria : ",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text(
                        malaria,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Hepatitis : ",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text(
                        " $hepatitis",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                      ),
                    ],
                  ),
                ],
              ),
              // const SizedBox(width: 5,),
              TextButton(
                  onPressed: () {
                    // Get.to(() => MedicalReport(image: image,));
                    //Image.file(controller.imageFile!)
                        Get.rawSnackbar(
                            messageText: const Text('Working on it..!!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                            isDismissible: true,
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.green[400]!,
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 35,
                            ),
                            margin: EdgeInsets.zero,
                            snackStyle: SnackStyle.GROUNDED);
                      },
                  child: Text(
                    "See Report",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
