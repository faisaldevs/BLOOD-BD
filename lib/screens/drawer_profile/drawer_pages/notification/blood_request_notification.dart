// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';
//
// class BloodRqNotification extends StatelessWidget {
//   BloodRqNotification({super.key});
//
//  final List<Map<String, dynamic>> userList =
//       (GetStorage().read('dataList') as List<dynamic>?)
//               ?.cast<Map<String, dynamic>>() ??
//           [];
//
//   @override
//   Widget build(BuildContext context) {
//     String showTime() {
//       DateTime now;
//
//       now = DateTime.now();
//
//       String formattedDate = DateFormat('dd MMM yy').format(now);
//
//       return formattedDate;
//     }
//
//     return ListView.builder(
//       itemCount: userList.length,
//       itemBuilder: (context, index) {
//         Map<String, dynamic> userData = userList[index];
//
//         // print("2nd Data :$userData");
//
//         return Container(
//           margin: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding: const EdgeInsets.all(10),
//                 width: Get.width,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: Get.width * .1,
//                       child: const CircleAvatar(
//                         backgroundImage: AssetImage("assets/images/profile.png",),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(right: 7),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     userData["patient_name"].toString(),
//                                     style: const TextStyle(
//                                         fontSize: 18, fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     showTime(),
//                                     style: const TextStyle(
//                                       color: Colors.green,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 4),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       const Text("Address : ",
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.bold)),
//                                       Text(userData["address"].toString(),
//                                           style: const TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w400)),
//                                     ],
//                                   ),
//                                   InkWell(
//                                     onTap: (){},
//                                     child: Container(
//                                       padding:  const EdgeInsets.symmetric(
//                                           horizontal: 4, vertical: 3),
//                                       decoration: BoxDecoration(
//                                         color: Colors.teal[400],
//                                         borderRadius: const BorderRadius.all(Radius.circular(16)),
//                                         border: Border.all(width: 1,color: Colors.cyan),
//                                       ),
//                                       child: const Text("Confirmed",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               TextButton(onPressed: (){}, child: const Text("View Details",style: TextStyle(color: Colors.green,decoration: TextDecoration.underline),)),
//
//               const Divider(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// //:  const Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       crossAxisAlignment: CrossAxisAlignment.center,
// //       children: [
// //         Icon(
// //           Icons.search,
// //           size: 120,
// //           color: Colors.black26,
// //         ),
// //         Text(
// //           "No Notification Found!",
// //           style: TextStyle(fontSize: 24, color: Colors.black26),
// //         ),
// //       ],
// //     )
