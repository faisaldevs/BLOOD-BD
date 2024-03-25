// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CardWidget extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//   final Function() onTap;
//
//   const CardWidget(
//       {super.key,
//       required this.title,
//       required this.imageUrl,
//       required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       focusColor: Colors.transparent,
//       overlayColor: MaterialStateProperty.all(Colors.transparent),
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(left: 10, top: 10),
//         height: Get.height * .2,
//         width: Get.width * .45,
//         child: Card(
//           surfaceTintColor: Colors.blue,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: Get.height * .1,
//                 child: Image.asset(
//                   imageUrl,
//                   color: Colors.red,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(title,
//                   style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.red)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'find_button.dart';

class UrgentRequest extends StatelessWidget {
  const UrgentRequest({super.key, required this.patientsName, required this.hospitalName, required this.address, required this.date, required this.bloodType});
  final String patientsName;
  final String hospitalName;
  final String address;
  final String date;
  final String bloodType;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      height: Get.height * .1.h,
      width: Get.width * .9.w,
      margin: const EdgeInsets.only(right: 15),

      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            offset: const Offset(0.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
      ),
      child: Row(
        children: [
          Container(
            width: Get.width * .25,
            height: Get.height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Colors.white60,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/blood_drop.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    bloodType,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              height: Get.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.greenAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 29),
                    child: Text(
                      patientsName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.add_box_sharp,size: 24,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          hospitalName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          address,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_sharp),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          date,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        // child: ElevatedButton(
                        //     onPressed: () {},
                        //     child: const Text("Urgent")),
                        child: FindDonorBtn(
                          onPressed: () {},
                          child: 'Urgent',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
