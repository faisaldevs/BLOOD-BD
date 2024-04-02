import 'dart:convert';
import 'package:blood_bd/api/api_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../screens/blood_request_donor/become_donor_page.dart';
import '../screens/blood_request_donor/update_donor.dart';
import '../utils/app_routes.dart';

class BecomeDonorController extends GetxController {
   // GetStorage sdStorage = GetStorage();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var token = GetStorage().read("token");
  TextEditingController patientNameController = TextEditingController();
  var bloodType;
  var bloodAmount;
  var healthIssue;
  var division;
  var district;
  var union;
  var thana;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactParsonNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();


  donorValidate()async{
    try{
      var res = await http.get(
          Uri.parse(ApiUrls.profileGet),
          headers: {
            "Accept" : "application/json",
            "Authorization" : token,
          }
      );

      if(res.statusCode == 200){
        var data  = jsonDecode(res.body);

        String status = data["donor_profile_status"];
        if (kDebugMode) {
          print("Profile Donor: $status");
        }

        if(status == 0.toString()){
          Get.to(const BecomeDonor());
        }else{
          // Get.to(const UpdateDonor());
          Get.to(const BecomeDonor());

        }


      }

    }catch(e){
      print("Error : e");
    }
  }

  searchDonor() async{
    print("pressend");
    // if (formKey.currentState!.validate()) {
    //   var patientName = patientNameController.text;
    //   var date = dateController.text;
    //   var time = timeController.text;
    //   var contactParsonPhone = numberController.text;
    //   var patientAddress = addressController.text;
    //   var contactParsonName = contactParsonNameController.text;


      // sdStorage.write("patientName", patientName);
      // sdStorage.write("bloodType", bloodType);
      // sdStorage.write("bloodAmount", bloodAmount);
      // sdStorage.write("healthIssue", healthIssue);
      // sdStorage.write("date", date);
      // sdStorage.write("time", time);
      //
      // sdStorage.write("patientAddress", patientAddress);
      // sdStorage.write("contactParsonName", contactParsonName);
      // sdStorage.write("contactParsonPhone", contactParsonPhone);

      try{
        print("validate");
        // String apiUrl = "https://starsoftjpn.xyz/api/auth/blood-donor";
        var res = await http.post(
          Uri.parse(ApiUrls.bloodDonorPost),
          headers: {
            "Accept": "application/json",
            "Authorization": token,
          },
          body: {
            // "patients_name": patientNameController.text,
            "blood_group": bloodType,
            "amount_bag": bloodAmount.toString(),
            // "date": dateController.text,
            // "date": "2024-01-06",
            // "time": "16:14:00",
            "health_issue": healthIssue,
            "division": "division",
            "district": "district",
            "upazila": "upazila",
            "union": "union",
            "address": addressController.text,
            "contact_person_name": contactParsonNameController.text,
            "contact_person_phone": numberController.text,
            // "note": "Note",
          },
        );

        if(res.statusCode == 201){
          Get.snackbar("Received", "Donor Data Received");
          Get.toNamed(home);
        }

        print(res.statusCode);
        print(res.body);

      }catch(e){
        print(e);
      }


      // Get.snackbar("Received", "Donor Data Received");
      // print("object");
    }
  }
// }
