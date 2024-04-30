import 'dart:convert';
import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/screens/blood_request_donor/become_donor/donor_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../screens/blood_request_donor/become_donor_page.dart';
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
 RxBool isLoading = false.obs;




  searchDonor() async{
    isLoading.value = true;
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
            "division": division,
            "district": district,
            "upazila": thana,
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
          isLoading.value = false;
        }else{
          isLoading.value = false;
        }

        print(res.statusCode);
        print(res.body);

      }catch(e){
        isLoading.value = false;
        print(e);
      }


      // Get.snackbar("Received", "Donor Data Received");
      // print("object");
    }




  String? id;
  String? userId;
  String? nameDonor;
  String? bloodGroupDonor;
  String? amountBagDonor;
  String? healthIssueDonor;
  String? divisionDonor;
  String? districtDonor;
  String? upazilaDonor ;
  String? unionDonor ;
  String? addressDonor;
  String? contact_person_nameDonor ;
  String? contact_person_phoneDonor ;
  String? last_donate_date;

  donorProfile()async {
    print("object");
    try{
      var res = await http.get(
          Uri.parse(ApiUrls.profileGet),
          headers: {
            "Accept" : "application/json",
            "Authorization" : token,
          }
      );
      print("object");
      print(res.statusCode);
      print(res.body);


      if(res.statusCode == 200){
        var body  = jsonDecode(res.body);

        // return ProfileModel.fromJson(body);
        var data = body["blood_donor"];

        id = data["id"].toString();
        userId = data["user_id"].toString();
        bloodGroupDonor = data["blood_group"];
        amountBagDonor = data["amount_bag"];
        healthIssueDonor = data["health_issue"];
        divisionDonor = data["division"];
        districtDonor = data["district"];
        upazilaDonor  = data["upazila"];
        unionDonor  = data["union"];
        addressDonor = data["address"];
        contact_person_nameDonor  = data["contact_person_name"];
        contact_person_phoneDonor  = data["contact_person_phone"];
        last_donate_date = data["last_donate_date"];

        var user = body["data"];

        nameDonor = user["name"];

        Get.to( const DonorProfile());
      } else if (res.statusCode == 404) {
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      } else{
        print(res.statusCode);
        print(res.body);
      }

    }catch(e){
      print("Error : $e");
    }
  }
  }
// }
