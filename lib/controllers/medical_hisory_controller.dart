import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../models/MedicalHistoryModel.dart';

class MedicalHistoryController extends GetxController {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   File? imageFile;
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
    print("image");
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
          // "image" : "image",
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
   Future<void> sendMultipartRequest() async {
    print("object");
     var uri = Uri.parse('https://starsoftjpn.xyz/api/auth/medical-history');
     var request = http.MultipartRequest('POST', uri);
     request.headers['Authorization'] = GetStorage().read("token").toString();
     request.fields['blood_group'] = bloodType!;
     request.fields['hemoglobin_level'] = hemoglobin.text;
     request.fields['hepatitis'] = hepatitis!;
     request.fields['malaria'] = malaria!;
     request.fields['institute_name'] = institutionName.text;
     request.fields['blood_pressure'] = bloodPressure.text;
     request.fields['test_date'] = dayOfTest.text;
     request.files.add(http.MultipartFile(
         'image',
         imageFile!.readAsBytes().asStream(),
         imageFile!.lengthSync(),
         filename: 'image.jpg'));

     var response = await http.Response.fromStream(await request.send());
     print(response.statusCode);
     print(response.body);
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