// import 'package:flutter/material.dart';
//
//
// class DropDownBtn extends StatelessWidget {
//
//
//    DropDownBtn({super.key,required this.onChanged, required this.dropDownList});
//  // List dropDownList = DataList.genderListData;
//    var onChanged;
//    final List dropDownList;
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: const InputDecoration(
//         // hintText: "hintText",
//         labelText: "label",
//         labelStyle: TextStyle(color: Colors.red),
//         contentPadding: EdgeInsets.only(left: 12),
//         counterStyle: TextStyle(fontWeight: FontWeight.bold),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.zero,
//           borderSide: BorderSide(color: Colors.black54, width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.zero,
//           borderSide: BorderSide(color: Colors.black54, width: 1),
//         ),
//       ),
//       items:  dropDownList.map((e) {
//         return DropdownMenuItem(
//             value: e,
//             child: Text(
//               e,
//               style: const TextStyle(fontWeight: FontWeight.normal),
//             ));
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }
// }
