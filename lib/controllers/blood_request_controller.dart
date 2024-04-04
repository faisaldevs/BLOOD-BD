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


  Future<RequestBloodModel> getRequestData() async {
    print("pressed.............1");
    try {
      // String appUrl = "https://starsoftjpn.xyz/api/v1/blood-request";
      var res = await http.get(Uri.parse(ApiUrls.bloodRequestGetApi));

      if (res.statusCode == 200) {
        if (kDebugMode) {
          print("200-status : ${res.body}");
        }
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        return RequestBloodModel.fromJson(responseData);

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