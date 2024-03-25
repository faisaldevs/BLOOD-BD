import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RequestBloodController extends GetxController {
  var token = GetStorage().read("token") ?? "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  var bloodType;
  var bloodAmount;
  var healthIssue;
  var division;
  var district;
  var union;
  var upazila;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactParsonNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<Map<String, dynamic>> dataList = [];

  onSaveRqBlood() async {
    print(token);
    if (formKey.currentState!.validate()) {
   try{
     print("validate");
     String apiUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
     var res = await http.post(
       Uri.parse(apiUrl),
       headers: {
         "Accept": "application/json",
         "Authorization": token,
       },
       body: {
         "patients_name": patientNameController.text,
         "blood_group": bloodType,
         "amount_bag": bloodAmount.toString(),
         // "date": dateController.text,
         "date": "2024-01-06",
         "time": "16:14:00",
         "health_issue": healthIssue,
         "division": "division",
         "district": "district",
         "upazila": "upazila",
         "union": "union",
         "address": addressController.text,
         "contact_person_name": contactParsonNameController.text,
         "contact_person_phone": numberController.text,
         "note": noteController.text,
       },
     );

     print(res.statusCode);
     print(res.body);
   }catch(e){
     print(e);
   }
    }
  }
}

//      final data = {
//         "patient_name": patientNameController.text,
//         "blood_type": bloodType,
//         "blood_amount": bloodAmount,
//         "health_issue": healthIssue,
//         "date": dateController.text,
//         "time": timeController.text,
//         "address": addressController.text,
//         "contact_person": contactParsonNameController.text,
//         "contact_person_number": numberController.text
//       };
//
//       saveData(data);
//
//       Get.offAllNamed(home);

//   void saveData(Map<String, dynamic> data) {
//     final box = GetStorage();
//     dataList.add(data);
//     box.write('dataList', dataList);
//
//     print("Data List :$dataList");
//     print("Data List : Done!!");
//   }
// }
