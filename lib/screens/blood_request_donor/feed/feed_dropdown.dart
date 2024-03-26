//
// import 'package:flutter/material.dart';
//
// class FeedDropdown extends StatelessWidget {
//   FeedDropdown({
//     super.key,
//     required this.dropDownList,
//     required this.label,
//     required this.onChanged,
//     // required this.hint,
//   });
//
//   final String label;
//   final List dropDownList;
//   var onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         hintText: label,
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.2),
//
//         // labelText: label,
//         hintStyle: const TextStyle(color: Colors.red),
//         contentPadding: const EdgeInsets.only(left: 12),
//         counterStyle: const TextStyle(fontWeight: FontWeight.bold),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: const OutlineInputBorder(
//            borderRadius: BorderRadius.all(Radius.circular(10)),
//           borderSide:BorderSide.none,
//         ),
//       ),
//       items: dropDownList.map((e) {
//         return DropdownMenuItem(
//             value: e,
//             child: Text(
//               e,
//               style: const TextStyle(fontWeight: FontWeight.normal,color: Colors.red,),
//
//             ));
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }
// }
