import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/screens/user_auth/login_screen/forget_password/forget_password_page.dart';
import 'package:blood_bd/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../screens/user_auth/login_screen/forget_password/forget_otp_verification_page.dart';
import '../utils/app_routes.dart';

class ForgetPassController extends GetxController {

  RxBool isLoading = false.obs;

  // GlobalKey<FormState> key = GlobalKey<FormState>();
  // GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  // GlobalKey<FormState> passKey = GlobalKey<FormState>();

  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  numberValidate(BuildContext context) async {
    isLoading.value = true;
    print("object");
      print("object");
      var res = await http
          .post(Uri.parse(ApiUrls.forgotPasswordPhonePost), body: {"phone": numberController.text});
      print("object");

      print(res.statusCode);
      print(res.body);

      if (res.statusCode == 200) {
        isLoading.value = false;
        Get.to(ForgetPassOtpVerification(number: numberController.text,));
      }
      else if (res.statusCode == 402){
        isLoading.value = false;
        var message = jsonDecode(res.body);
        var msg = message["response"];
        print(msg);
        CustomSnackBar().showSnackBar(
            context: context,
            content: msg.toString(),
            backgroundColor: Colors.red);
      }
      else if (res.statusCode == 404) {
        isLoading.value = false;
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      }
    // }
  }

  otpValidate(BuildContext context) async {
    isLoading.value = true;
    print("object");
    // String appUrl = "https://starsoftjpn.xyz/api/v1/forgot-password-otp-check";
    // if (key.currentState!.validate()) {
      print("object");
      var res = await http.post(Uri.parse(ApiUrls.forgotPasswordOtpPost), body: {
        "phone": numberController.text,
        "otp": otpController.text,
      });
      print("object");

      print(res.statusCode);
      print(res.body);

      if (res.statusCode == 200) {
        isLoading.value = false;
        Get.to(ForgetPasswordPage());
      }
      else if (res.statusCode == 402){
        isLoading.value = false;
        var message = jsonDecode(res.body);
        var msg = message["response"];
        print(msg);
        CustomSnackBar().showSnackBar(
            context: context,
            content: msg.toString(),
            backgroundColor: Colors.red);
      }
      else if (res.statusCode == 404) {
        isLoading.value = false;
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      }else{
        isLoading.value = false;
      }
    // }
  }

  forgetValidation(BuildContext context) async {
    isLoading.value = true;
    print("object");
    // String appUrl = "https://starsoftjpn.xyz/api/v1/forgot-password-update";
    // if (key.currentState!.validate()) {
      print("object");
      var res = await http.post(Uri.parse(ApiUrls.forgotPasswordPost), body: {
        "phone": numberController.text,
        "password": newPassword.text,
        "confirm_password": confirmPassword.text,
      });
      print("object");

      print(res.statusCode);
      print(res.body);

      if (res.statusCode == 200) {
        isLoading.value = false;
        var message = jsonDecode(res.body);
        var msg = message["response"];
        print(msg);
        CustomSnackBar().showSnackBar(
            context: context,
            content: msg.toString(),
            backgroundColor: Colors.red);

        Get.offAllNamed(login);

        numberController.text = "";
        otpController.text = "";
        newPassword.text = "";
        confirmPassword.text = "";


      }else if (res.statusCode == 404) {
        isLoading.value = false;
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      }
    // }
  }

  // resendOtp()async{
  //   var res = await http
  //       .post(Uri.parse(ApiUrls.forgotPasswordPhonePost), body: {"phone": numberController.text});
  //   print("object");
  //
  //   print(res.statusCode);
  //   print(res.body);
  //
  //   if (res.statusCode == 200) {
  //     Get.to(ForgetPassOtpVerification(number: numberController.text,));
  //   }else if (res.statusCode == 404) {
  //     GetStorage().erase();
  //     Get.offAllNamed(welcomePage);
  //
  //   }
  //   else{
  //     print(res.statusCode);
  //     print(res.body);
  //
  //   }
  // }

}
