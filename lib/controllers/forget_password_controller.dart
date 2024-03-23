import 'package:blood_bd/screens/user_auth/login_screen/forget_password/forget_password_page.dart';
import 'package:blood_bd/screens/user_auth/login_screen/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../screens/user_auth/OTP_verification/forget_pass_otp_verification.dart';

class ForgetPassController extends GetxController {
  GlobalKey<FormState> passKey = GlobalKey<FormState>();
  GlobalKey<FormState> key = GlobalKey<FormState>();
   TextEditingController numberController = TextEditingController();
   TextEditingController newPassword = TextEditingController();
   TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();


   numberValidate() async{
     print("object");
     String appUrl = "https://starsoftjpn.xyz/api/v1/forgot-password-by-phone";
     if(key.currentState!.validate()){
       print("object");
       var res = await http.post(Uri.parse(appUrl),body: {
         "phone" : numberController.text
       });
       print("object");

       print(res.statusCode);
       print(res.body);

       if(res.statusCode == 200){
         Get.to(ForgetPassOtpVerification());
       }
     }
   }


  otpValidate() async{
    print("object");
    String appUrl = "https://starsoftjpn.xyz/api/v1/forgot-password-otp-check";
    if(key.currentState!.validate()){
      print("object");
      var res = await http.post(Uri.parse(appUrl),body: {
        "phone" : numberController.text,
        "otp" : otpController.text,
      });
      print("object");

      print(res.statusCode);
      print(res.body);

      if(res.statusCode == 200){
        Get.to(ForgetPasswordPage());
      }
    }
  }

  forgetValidation() async{
    print("object");
    String appUrl = "https://starsoftjpn.xyz/api/v1/forgot-password-update";
    if(key.currentState!.validate()){
      print("object");
      var res = await http.post(Uri.parse(appUrl),body: {
        "phone" : numberController.text,
        "password" : newPassword.text,
        "confirm_password" : confirmPassword.text,
      });
      print("object");

      print(res.statusCode);
      print(res.body);

      if(res.statusCode == 200){
        Get.to(const LoginScreen());
      }
    }
  }
}
