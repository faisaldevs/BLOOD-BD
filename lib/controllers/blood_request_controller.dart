import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/blood_request_model.dart';


class BloodRequestController extends GetxController{


  RxBool isVisible = false.obs;

  visibility(){
    isVisible.value = !isVisible.value;
  }


  Future<List<RequestBloodModel>> getRequestData() async {
    print("pressed.............1");
    try {
      // String appUrl = "https://starsoftjpn.xyz/api/v1/blood-request";
      var res = await http.get(Uri.parse(ApiUrls.bloodRequestGetApi));

      var jsonDataDecoded = json.decode(res.body);
      List data = jsonDataDecoded['data'] as List;
      if (res.statusCode == 200) {
        if (kDebugMode) {
          print("200-status : ${res.body}");
        }
        return data.map((e) {
          final map = e as Map<String, dynamic>;
          return RequestBloodModel(
            patientsName: map["patients_name"],
            bloodGroup: map["blood_group"],
            amountBag : map["amount_bag"],
            date: map["date"],
            time: map["time"],
            healthIssue: map["health_issue"],
            hospitalName: map["hospital_name"],
            district: map["district"],
            division: map["division"],
            union: map["upazila"],
            upazila: map["union"],
            address: map["address"],
            contactPersonName: map["contact_person_name"],
            contactPersonPhone: map["contact_person_phone"],
            note: map["note"],
          );
        }).toList();

      }
      else {
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


}