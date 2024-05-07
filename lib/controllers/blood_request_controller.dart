import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/app_notifications/notification_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/blood_request_model.dart';
import '../utils/app_routes.dart';


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
      var res = await http.get(Uri.parse(ApiUrls.bloodRequestWithoutMeGet),
          headers: {
        "Accept" : "application/json",
        "Authorization" : GetStorage().read("token").toString(),
      });
      if (kDebugMode) {
        print("200-status 1: ${res.statusCode}");
        print("200-status 2: ${res.body}");
      }


      if (res.statusCode == 200) {
        if (kDebugMode) {
          print("200-status : ${res.body}");
        }
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        return RequestBloodModel.fromJson(responseData);

      } else if (res.statusCode == 404) {
        // GetStorage().erase();
        // Get.offAllNamed(welcomePage);
        print("bloodRequestWithoutMeGet");

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


donateBlood(requestId, bloodAmount, requestUserId, deviceToken)async{
    print("Donate Blood");
  try {
    var res = await http.get(
        Uri.parse(ApiUrls.profileGet),
        headers: {
          "Accept" : "application/json",
          "Authorization" : GetStorage().read("token").toString(),
        }
    );
    print(res.statusCode);
    if(res.statusCode == 200){
      var jsonBody = jsonDecode(res.body);
      var body = jsonBody["data"];
      var donorStatus = body["donor_profile_status"];
      var donorName = body["name"];
      print("Status : $donorStatus");

      if(donorStatus == 1){
        var donorBody = jsonBody["blood_donor"];
        var donorId =  donorBody["id"];
        var donorBloodGroup =  donorBody["blood_group"];
        var donorNumber =  donorBody["contact_person_phone"];
        print("DonorId : $donorId");
        // String requestId = requestId.toString();

        var response1 = await http.post(
          Uri.parse(ApiUrls.bloodDonorNotificationPost),
          headers: {
            "Accept": "application/json",
            "Authorization": GetStorage().read("token").toString(),
          },
          body: {
            "blood_request_id": requestId.toString(),
            "blood_request_user_id": requestUserId.toString(),
            "blood_donor_id": donorId.toString(),
            "request_amount_bag": bloodAmount.toString(),
          },
        );
        var body = jsonDecode(response1.body);
        // print(response1.statusCode.toString());
        // print(response1.body);
        var success = body["success"];
        print("---------"+success.toString());
        NotificationHelper().customNotificationDonate(deviceToken, "donor", donorBloodGroup, donorNumber, donorName);
        if(success == "true"){
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

          // NotificationHelper().sendNotification(deviceToken);

        }
        else{
          print(response1.statusCode);
          print(response1.body);
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

    }else if (res.statusCode == 404) {
      GetStorage().erase();
      Get.offAllNamed(welcomePage);
    }
    else{

    }
  } catch (e) {
    // loading.value = false;
    print("Error : $e");
  }
}


}


