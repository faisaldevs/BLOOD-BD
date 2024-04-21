import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/blood_request_model.dart';


class BloodRequestController extends GetxController{
  String token = GetStorage().read("token") ?? "";

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
        print("Error 12 : $e");
      }
    }
    throw Exception("Loading failed !!!");
  }


donateBlood(requestId, bloodAmount)async{
    print("try");
  try {
    var res = await http.get(
        Uri.parse(ApiUrls.profileGet),
        headers: {
          "Accept" : "application/json",
          "Authorization" : token,
        }
    );
    print(res.statusCode);
    print("try");

    if(res.statusCode == 200){
      var jsonBody = jsonDecode(res.body);
      var body = jsonBody["data"];
      var donorStatus = body["donor_profile_status"];


      print("Status : $donorStatus");
      if(donorStatus == 1){
        var donorBody = jsonBody["blood_donor"];
        var donorId =  donorBody["id"];
        print("DonorId : $donorId");
        // String requestId = requestId.toString();

        var response = await http.post(
          Uri.parse(ApiUrls.bloodDonorNotificationPost),
          headers: {
            "Accept": "application/json",
            "Authorization": token,
          },
          body: {
            "blood_request_id": requestId.toString(),
            "blood_donor_id": donorId.toString(),
            "request_amount_bag": bloodAmount.toString(),
          },
        );
        print(response.statusCode);
        print(response.body);
        if(response == 201){
          print("success");
          Get.rawSnackbar(
              messageText: const Text(
                  'Request successful',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
              ),
              isDismissible: true,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red[400]!,
              icon : const Icon(Icons.settings, color: Colors.white, size: 35,),
              margin: EdgeInsets.zero,
              snackStyle: SnackStyle.GROUNDED
          );
        }


      }
      else{
        print("Test");
        Get.rawSnackbar(
            messageText: const Text(
                'Become a Donor First !!!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                )
            ),
            isDismissible: true,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red[400]!,
            icon : const Icon(Icons.settings, color: Colors.white, size: 35,),
            margin: EdgeInsets.zero,
            snackStyle: SnackStyle.GROUNDED
        );
      }

    }
  } catch (e) {
    // loading.value = false;
    print("Error : $e");
  }
}


}


