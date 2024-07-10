import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/app_routes.dart';

class ChangePassController extends GetxController {
  GlobalKey<FormState> changePassKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  String token = GetStorage().read("token") ?? "";

  passChange(BuildContext context) async {
    isLoading.value = true;
    print(currentPassword.text);
    print(newPassword.text);
    print(confirmNewPassword.text);
    print("pressed");
    try {
      // String appUrl = "https://starsoftjpn.xyz/api/auth/change-password";
      var response =
          await http.post(Uri.parse(ApiUrls.changePasswordPost), headers: {
        "Accept": "application/json",
        "Authorization": token,
      }, body: {
        "currentPassword": currentPassword.text,
        "newPassword": newPassword.text,
        "confirmNewPassword": confirmNewPassword.text,
      });
      if(response.statusCode == 200){
        isLoading.value = false;
      }
      else if (response.statusCode == 201){
        isLoading.value = false;
        var message = jsonDecode(response.body);
        var msg = message["message"];
        print(msg);
        CustomSnackBar().showSnackBar(
            context: context,
            content: msg.toString() +"fully",
            backgroundColor: Colors.red);
        Get.offAllNamed(home);

      }
      else if (response.statusCode == 404) {
        GetStorage().erase();
        isLoading.value = false;
        Get.offAllNamed(welcomePage);
      }else{
        isLoading.value = false;
      }

      print(response.statusCode.toString());
      print(response.body);
    } catch (e) {
      isLoading.value = false;
      print(e);
    }

    // if(response.statusCode == 200){
    //   print(object)
    // }
  }
}
