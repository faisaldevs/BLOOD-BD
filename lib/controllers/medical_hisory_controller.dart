import 'dart:convert';
import 'dart:core';
import 'package:blood_bd/screens/drawer_profile/drawer_pages/medical_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/MedicalHistoryModel.dart';

class MedicalHistoryController extends GetxController {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

   TextEditingController hemoglobin = TextEditingController();
   TextEditingController institutionName = TextEditingController();
   TextEditingController dayOfTest = TextEditingController();
   TextEditingController bloodPressure = TextEditingController();
   String? bloodType;
   String? hepatitis;
   String? malaria;
   // String? institutionName;
  var token =  GetStorage().read("token");

  test(){
    print(hemoglobin);
    print(dayOfTest);
    print(bloodPressure);
    print(bloodType);
    print(hepatitis);
    print(malaria);
    print(institutionName);
    print(token);
  }

  onSaveReport() async{
    if (formKey.currentState!.validate()) {

      try{
        var api  = "https://starsoftjpn.xyz/api/auth/medical-history";

        var res = await http.post(Uri.parse(api),

          headers:  {
          "Accept" : "application/json",
            "Authorization" : token,
          },
          body: {
          "blood_group" : bloodType.toString(),
          "hemoglobin_level" : hemoglobin.text,
          "hepatitis" : hepatitis.toString(),
          "malaria" : malaria.toString(),
          "institute_name" : institutionName.text,
          "blood_pressure" : bloodPressure.text,
          // "image" : bloodType,
          "test_date" : dayOfTest.text,
          },
        );
        print(res.statusCode);
        print(res.body);

        if(res.statusCode == 200){
          print("Body : ${res.body}");
        }

      }catch(e) {
        print("Error : $e");
      }



    }
  }


 Future<MedicalHistoryModel> getMedicalHistory()async{

   try{
     var api  = "https://starsoftjpn.xyz/api/auth/medical-history";

     var res = await http.get(Uri.parse(api),
       headers:  {
         "Accept" : "application/json",
         "Authorization" : token,
       },
     );
     print(res.statusCode);
     print(res.body);

     if(res.statusCode == 200){
       print("Body : ${res.body}");
       var body = jsonDecode(res.body);

       return MedicalHistoryModel.fromJson(body);
     }

   }catch(e) {
     print("Error : $e");
   }

   throw "";



  }


}