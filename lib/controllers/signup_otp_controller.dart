import 'package:blood_bd/screens/user_auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SignupOTPController extends GetxController {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

   TextEditingController signupOtpController = TextEditingController();


   Future<void> otpValidate(TextEditingController numberController) async {
      print("object");
      String appUrl = "https://starsoftjpn.xyz/api/v1/forgot-password-otp-check";
      // if (formKey.currentState!.validate()) {
         print("object");
         print("Number :"+numberController.text);
         print("OTP :"+signupOtpController.text);
         print("object");
        try{
           var res = await http.post(Uri.parse("https://starsoftjpn.xyz/api/auth/register-otp-check"), body: {
              "phone": numberController.text,
              "otp": signupOtpController.text,
           });
           print("object");

           print(res.statusCode);
           print(res.body);

           if (res.statusCode == 200) {
              Get.snackbar(
                 "Sign Up Successful",
                 "message",
              );
              Get.offAll(const LoginScreen());
           }
        }catch(e){
           print("Error : $e");
        }
      }
   }

   // FocusNode focusNode = FocusNode();
// }
