import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/blood_bank_controller.dart';
import 'blood_heros/blood_hero.dart';

class BloodHeroes extends StatelessWidget {
   BloodHeroes({super.key});
  BloodBankController controller = Get.put(BloodBankController());

  @override
  Widget build(BuildContext context) {
    // String? name = "Faisal";
    // String? address = "Kazipara, Mirpur, Dhaka";
    // String? number1 = "01903440069";
    // String? number2 = "0122355";

    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        title: const Text("Blood Heroes"),
        foregroundColor: AppTheme.textColorRed,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      // body: FutureBuilder(future: controller.getBloodBankData(), builder: (context, snapshot) {
      //
      //   if(snapshot.hasData){
      //     // List data = snapshot.data
      //     return ListView.builder(
      //       itemCount: snapshot.data?.length,
      //       itemBuilder: (context, index) {
      //         return Expanded(child: BloodHeroList());
      //       },);
      //   }else{
      //     return Center(child: CircularProgressIndicator());
      //   }
      //
      // },),
      // ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) => Container(
      //     color: Colors.white,
      //     margin: const EdgeInsets.only(bottom: 4, top: 8),
      //     padding: const EdgeInsets.only(left: 16, top: 10),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           name,
      //           style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      //         ),
      //         Text(
      //           address,
      //           style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 4, bottom: 0),
      //           child: Text(
      //             "contract :",
      //             style:
      //                 TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         Row(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(right: 8),
      //               child: Row(
      //                 children: [
      //                   IconButton(
      //                     onPressed: () async {
      //                       launchUrlString("tel:$number1");
      //                     },
      //                     icon: Row(
      //                       children: [
      //                         const Icon(
      //                           Icons.call,
      //                           size: 20,
      //                         ),
      //                         const SizedBox(
      //                           width: 4,
      //                         ),
      //                         Text(
      //                           number1,
      //                           style: TextStyle(
      //                               fontSize: 14.sp,
      //                               fontWeight: FontWeight.w400),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   IconButton(
      //                     onPressed: () {
      //                       launchUrlString("tel:$number2");
      //                     },
      //                     style: const ButtonStyle(
      //                         padding:
      //                             MaterialStatePropertyAll(EdgeInsets.all(0))),
      //                     icon: Row(
      //                       children: [
      //                         const Icon(
      //                           Icons.call,
      //                           size: 20,
      //                         ),
      //                         const SizedBox(
      //                           width: 4,
      //                         ),
      //                         Text(
      //                           number2,
      //                           style: TextStyle(
      //                               fontSize: 14.sp,
      //                               fontWeight: FontWeight.w400),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

//const BloodHeroList()
