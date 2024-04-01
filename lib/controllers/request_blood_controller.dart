import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/models/search_requested_donor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../screens/blood_request_donor/request_blood/request_blood_filter_page.dart';

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
    // if (formKey.currentState!.validate()) {

    print(bloodType);
    print(dateController.text);
    print(division.toString());
    print(district.toString());
    print(upazila.toString());
    print(union.toString());

    try {
      print("validate");
      // String apiUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
      var res = await http.post(
        Uri.parse(ApiUrls.bloodRequestPost),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
        body: {
          "patients_name": patientNameController.text,
          "blood_group": bloodType,
          "amount_bag": bloodAmount.toString(),
          // "date": dateController.text,
          "hospital_name": hospitalController.text,
          "date": "2024-01-06",
          "time": "16:14:00",
          "health_issue": healthIssue,
          "division": division,
          "district": district,
          "upazila": upazila,
          "union": union,
          "address": addressController.text,
          "contact_person_name": contactParsonNameController.text,
          "contact_person_phone": numberController.text,
          "note": noteController.text,
        },
        // body: {
        //   "patients_name": "Faisal",
        //   "blood_group": "A+",
        //   "amount_bag": "1",
        //   // "date": dateController.text,
        //   "date": "2024-01-06",
        //   "time": "16:14:00",
        //   "health_issue": "healthIssue",
        //   "division": "dhaka",
        //   "district": "dhaka",
        //   "hospital_name": "Dhaka",
        //   "upazila": "dhaka",
        //   "union": "dhaka",
        //   "address": "addressController.text",
        //   "contact_person_name": "contactParson",
        //   "contact_person_phone": "01725966666",
        //   "note" : "noteController.text",
        // },
      );

      print(res.statusCode);
      print(res.body);

      if (res.statusCode == 201) {
        var data = jsonDecode(res.body);

        var success = data["success"];
        print(success);
        // var message = data["message"];
        var bloodRequestId =
            data["blood_request_id"].toString() ?? "bloodRequestId";

        print("bloodRequestId : $bloodRequestId");
        print("bloodType : $bloodType");
        print("bloodAmount : $bloodAmount");
        print("division : $division");
        print("district : $district");
        Get.to(FilterPage(
          bloodRequestId: bloodRequestId,
          bloodType: bloodType,
          division: division,
          district: district,
          bloodAmount: bloodAmount,
        ));

        // var dataList = data["bloodRDonors"] as List;
        // print(success);
        // print(dataList);
        //
        // if(success == true){
        //
        //   Get.to(FilterPage(bloodRequestId: bloodRequestId, bloodType: "A+", division: "Dhaka", district: "Dhaka",));
        // }

        // print( "res.statusCode");
        // var res1 = await http.post(Uri.parse("https://starsoftjpn.xyz/api/auth/blood-donor-with-search"),
        //     headers: {
        //       "Accept": "application/json",
        //       "Authorization": token,
        //     },
        //     body: {
        //       "blood_group" : "O+",
        //       "division" : "Dhaka",
        //       "district" : "Dhaka",
        //     }
        // );
        //
        // print( res1.statusCode);
        // print( res1.body);
        //
        // var donor = jsonDecode(res1.body);
        // var donorList = donor["data"] as List;
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<List<DonorSearch>> donorSearch() async {
    try {
      // String appUrl = "https://starsoftjpn.xyz/api/v1/blood-request";
      var res = await http.post(
          Uri.parse("https://starsoftjpn.xyz/api/auth/blood-donor-with-search"),
          headers: {
            "Accept": "application/json",
            "Authorization": token,
          },
          body: {
            "blood_group": "O+",
            "division": "Dhaka",
            "district": "Dhaka",
          });

      var jsonDataDecoded = json.decode(res.body);
      List data = jsonDataDecoded['data'] as List;
      if (res.statusCode == 200) {
        if (kDebugMode) {
          print("200-status : ${res.body}");
        }
        return data.map((e) {
          final map = e as Map<String, dynamic>;
          return DonorSearch(
            id: map["id"].toString(),
            bloodGroup: map["blood_group"],
            amountBag: map["amount_bag"],
            healthIssue: map["health_issue"],
            district: map["district"],
            division: map["division"],
            union: map["upazila"],
            upazila: map["union"],
            address: map["address"],
            contactPersonName: map["contact_person_name"],
            contactPersonPhone: map["contact_person_phone"],
            // user: map["user"]
          );
        }).toList();
      } else {
        if (kDebugMode) {
          print("failed code${res.statusCode}");
        }
        if (kDebugMode) {
          print("failed body${res.body}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error : $e");
      }
    }
    throw Exception("Loading failed !!!");
  }

  confirmBlood(
      String bloodRequestId, String bloodDonorId, String bloodAmount) async {
    print("validate");
    print(bloodRequestId);
    print(bloodDonorId);
    print(bloodAmount);
    // String apiUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
    var res = await http.post(
      Uri.parse(ApiUrls.bloodRequestNotificationPost),
      headers: {
        "Accept": "application/json",
        "Authorization": token,
      },
      body: {
        "blood_request_id": bloodRequestId,
        "blood_donor_id": bloodDonorId,
        "request_amount_bag": bloodAmount,
      },
    );

    print(res.statusCode);
    print(res.body);

    if (res.statusCode == 200) {}
  }
}
