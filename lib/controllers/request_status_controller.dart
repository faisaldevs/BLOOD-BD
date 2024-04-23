import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/request_status_model.dart';
import '../utils/app_routes.dart';


class RequestStatusController extends GetxController {
  RxString statusBool = "0".obs;
  var token = GetStorage().read("token") ?? "null";

  Future<RequestStatusModel> getDonationList() async {
    print("pressed.............1");
    try {
      print(token);
      final response = await http.get(
        Uri.parse(
            "https://starsoftjpn.xyz/api/auth/blood-donate-notification"),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        return RequestStatusModel.fromJson(responseData);
      }else if (response.statusCode == 404) {
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      } else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to load blood request notification');
      }
    } catch (e) {
      print("Error : $e");
    }

    throw Exception("Loading failed !!!");
  }

  // Future<NotificationRequestModel> getNotificationRequest() async {
  //   print("pressed.............1");
  //   try {
  //     print(token);
  //     final response = await http.get(
  //       Uri.parse("https://starsoftjpn.xyz/api/auth/blood-donor-notification"),
  //       headers: {
  //         "Accept": "application/json",
  //         "Authorization": token,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = jsonDecode(response.body);
  //       print(responseData);
  //       return NotificationRequestModel.fromJson(responseData);
  //     } else {
  //       print(response.statusCode);
  //       print(response.body);
  //       throw Exception('Failed to load blood request notification');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //
  //   throw Exception("Loading failed !!!");
  // }
  //
  // sentStatus() {}
  //
  // donationStatus(notificationId, status) async {
  //   print("Notification Id :$notificationId");
  //   print("Status : $status");
  //
  //   var response = await http.post(
  //       Uri.parse(ApiUrls.bloodRequestNotificationReceiverStatusPost),
  //       headers: {
  //         "Accept": "application/json",
  //         "Authorization": token,
  //       },
  //       body: {
  //         "blood_request_notification_id": notificationId.toString(),
  //         "receiver_status": status.toString(),
  //       });
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     print("done");
  //     Get.rawSnackbar(
  //         messageText: const Text('Done..!!',
  //             style: TextStyle(color: Colors.white, fontSize: 14)),
  //         isDismissible: true,
  //         duration: const Duration(milliseconds: 800),
  //         backgroundColor: Colors.red[400]!,
  //         icon: const Icon(
  //           Icons.done_all_outlined,
  //           color: Colors.white,
  //           size: 35,
  //         ),
  //         margin: EdgeInsets.zero,
  //         snackStyle: SnackStyle.GROUNDED);
  //   }
  // }

// statusUpdate(status){
//   if(status == "Accepted"){
//     statusBool.value = "1";
//   }else if(status == "Canceled"){
//     statusBool.value = "2";
//   }
// }
}
