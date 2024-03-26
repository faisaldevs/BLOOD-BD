import 'package:blood_bd/api/api_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DrawerProfileController extends GetxController {
  var token = GetStorage().read("token");

  RxBool switchValue = true.obs;

  // activeStc() {
  //   switchValue.value = !switchValue.value;
  // }

  activeStatus(bool value) async {
    switchValue.value = value;
    // String appUrl = "https://starsoftjpn.xyz/api/auth/update-donor-status";
    String appUrl = ApiUrls.donorStatusUpdatePost;

    if (value == true) {
      print("object");

      try {
        var res = await http.post(
          Uri.parse(appUrl),
          headers: {"Authorization": token},
          body: {"donor_status": 1.toString()},
        );
        print(res.statusCode);
        print(res.body);
      } catch (e) {
        print(e);
      }
    } else {
      print("null");
      var res1 = await http.post(
        Uri.parse(appUrl),
        headers: {"Authorization": token},
        body: {"donor_status": 0.toString()},
      );
      print(res1.statusCode);
      print(res1.body);
    }

    Get.snackbar(
      "Active status ",
      "Active status on",
      maxWidth: Get.width * .55,
      duration: const Duration(milliseconds: 800),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.red,
      icon: switchValue.value
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.check_circle,
            ),
      titleText: const Text("Active status ",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
      messageText: switchValue.value
          ? RichText(
              text: const TextSpan(children: [
              TextSpan(
                text: "Active status  ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black),
              ),
              TextSpan(
                text: "on",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.green),
              )
            ]))
          : RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Active status  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "off",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
