import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/become_donor_controller.dart';
import '../../../utils/app_colors.dart';

class DonorProfile extends StatefulWidget {
   const DonorProfile({super.key});

  @override
  State<DonorProfile> createState() => _DonorProfileState();
}

class _DonorProfileState extends State<DonorProfile> {
  BecomeDonorController controller = Get.put(BecomeDonorController());
  @override
  void initState() {
    // TODO: implement initState
    controller.donorProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var name  = controller.nameDonor ?? "";
    print(name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        title: const Text("Donor Profile"),
        foregroundColor: AppTheme.primaryRed,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body:  Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Text(
                    "Name : $name",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: const Text(
                          "Name",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: const Text(
                          "Name",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: const Text(
                          "Name",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: const Text(
                          "Name",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: const Text(
                          "Name",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: const Text(
                          "Name",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

      // Container(
      //   margin: const EdgeInsets.all(16),
      //   child: Column(
      //     children: [
      //       Container(
      //         padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //         width: Get.width,
      //         decoration: BoxDecoration(
      //             color: Colors.redAccent,
      //             borderRadius: BorderRadius.all(Radius.circular(16))),
      //         child: Text(
      //           "Name",
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(right: 5),
      //               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //               width: Get.width,
      //               decoration: const BoxDecoration(
      //                   color: Colors.redAccent,
      //                   borderRadius: BorderRadius.all(Radius.circular(16))),
      //               child: const Text(
      //                 "Name",
      //                 style:
      //                     TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(left: 5),
      //               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //               width: Get.width,
      //               decoration: const BoxDecoration(
      //                   color: Colors.redAccent,
      //                   borderRadius: BorderRadius.all(Radius.circular(16))),
      //               child: const Text(
      //                 "Name",
      //                 style:
      //                     TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(right: 5),
      //               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //               width: Get.width,
      //               decoration: const BoxDecoration(
      //                   color: Colors.redAccent,
      //                   borderRadius: BorderRadius.all(Radius.circular(16))),
      //               child: const Text(
      //                 "Name",
      //                 style:
      //                 TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(left: 5),
      //               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //               width: Get.width,
      //               decoration: const BoxDecoration(
      //                   color: Colors.redAccent,
      //                   borderRadius: BorderRadius.all(Radius.circular(16))),
      //               child: const Text(
      //                 "Name",
      //                 style:
      //                 TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(right: 5),
      //               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //               width: Get.width,
      //               decoration: const BoxDecoration(
      //                   color: Colors.redAccent,
      //                   borderRadius: BorderRadius.all(Radius.circular(16))),
      //               child: const Text(
      //                 "Name",
      //                 style:
      //                 TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(left: 5),
      //               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //               width: Get.width,
      //               decoration: const BoxDecoration(
      //                   color: Colors.redAccent,
      //                   borderRadius: BorderRadius.all(Radius.circular(16))),
      //               child: const Text(
      //                 "Name",
      //                 style:
      //                 TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
