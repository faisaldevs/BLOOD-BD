import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../global/app_routes.dart';

class LoginController extends GetxController {
  GetStorage getStorage = GetStorage();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLogin = false.obs;

  RxBool isVisible = true.obs;

  visibility() {
    isVisible.value = !isVisible.value;
  }

  RxBool show = false.obs;

  showFunction() {
    show.value = !show.value;
  }

  Future<Text> loginForm() async {
    if (formKey.currentState!.validate()) {
      isLogin.value = true;

      if (kDebugMode) {
        print("validation success");
      }

      try {
        var response = await post(
            Uri.parse("https://starsoftjpn.xyz/api/auth/login"),
            body: {
              "phone": numberController.text,
              "password": passwordController.text,
            });

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          var accessToken = data["access_token"];
          var tokenType = data["token_type"];

          String token = tokenType+accessToken.toString();

          var id = data["user"]["id"];
          var name = data["user"]["name"].toString();
          var phone = data["user"]["phone"].toString();
          var blood = data["user"]["blood"].toString();
          String message = data["message"].toString();

          getStorage.write("token", token);
          getStorage.write("id", id);
          getStorage.write("name", name);
          getStorage.write("phone", phone);
          getStorage.write("blood", blood);

          Get.snackbar(
            "Login Successes",
            message,
          );

          isLogin.value = true;
          Get.offAllNamed(home);
          // numberController.clear();
          // passwordController.clear();
        } else {
          isLogin.value = false;
          Get.snackbar(
            "Login failed${response.statusCode}",
            "Number or Password was wrong..",
          );
        }
      } catch (e) {
        isLogin.value = false;
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }

    return const Text("data");
  }

  forgetButton() {}
}
