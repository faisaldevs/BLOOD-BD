import 'dart:convert';
import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/app_notifications/notification_helper.dart';
import 'package:blood_bd/models/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/notification_request_model.dart';
import '../utils/app_routes.dart';

class DonationStatusController extends GetxController {
  RxString statusBool = "0".obs;
  var token = GetStorage().read("token") ?? "null";

  Future<DonationModel> getDonationList() async {
    print("pressed.............1");
    try {
      print(token);
      final response = await http.get(
        //"https://starsoftjpn.xyz/api/auth/blood-request-notification"
        Uri.parse(ApiUrls.bloodRequestNotificationGet),
        headers: {
          "Accept": "application/json",
          "Authorization": "bearer"+GetStorage().read("token"),
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return DonationModel.fromJson(responseData);
      }
      // else if (response.statusCode == 404) {
      //   GetStorage().erase();
      //   Get.offAllNamed(welcomePage);
      // }
      else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to load blood request notification');
      }
    } catch (e) {
      print("Error : $e");
    }

    throw Exception("Loading failed !!!");
  }

  Future<NotificationRequestModel> getNotificationRequest() async {
    print("pressed.............1");
    try {
      print(token);
      final response = await http.get(
        Uri.parse(ApiUrls.bloodDonorNotificationGet),
        headers: {
          "Accept": "application/json",
          "Authorization": "bearer"+GetStorage().read("token"),
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        return NotificationRequestModel.fromJson(responseData);
      }
      // else if (response.statusCode == 404) {
      //   GetStorage().erase();
      //   Get.offAllNamed(welcomePage);
      // }
      else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to load blood request notification');
      }
    } catch (e) {
      print(e);
    }

    throw Exception("Loading failed !!!");
  }

  sentStatus() {}

  donationStatus(notificationId, status,deviceToken) async {
    print("Notification Id :$notificationId");
    print("Status : $status");

    var response = await http.post(
        Uri.parse(ApiUrls.bloodRequestNotificationReceiverStatusPost),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
        body: {
          "blood_request_notification_id": notificationId.toString(),
          "receiver_status": status.toString(),
        });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print("done");

      NotificationHelper().sendNotification(deviceToken);

      Get.rawSnackbar(
          messageText: const Text('Done..!!',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: true,
          duration: const Duration(milliseconds: 800),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.done_all_outlined,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    }else if (response.statusCode == 404) {
      GetStorage().erase();
      Get.offAllNamed(welcomePage);
    }
  }

// statusUpdate(status){
//   if(status == "Accepted"){
//     statusBool.value = "1";
//   }else if(status == "Canceled"){
//     statusBool.value = "2";
//   }
// }
}
