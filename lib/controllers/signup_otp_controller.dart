import 'dart:convert';

import 'package:blood_bd/screens/user_auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/custom_snackbar.dart';


class SignupOTPController extends GetxController {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

   TextEditingController signupOtpController = TextEditingController();
   RxBool isLoading = false.obs;


   Future<void> otpValidate(TextEditingController numberController,BuildContext context) async {

      isLoading.value = true;
      print("object");
      // String appUrl = "https://starsoftjpn.xyz/api/v1/forgot-password-otp-check";
      // if (formKey.currentState!.validate()) {
         print("object");
         print("Number :${numberController.text}");
         print("OTP :${signupOtpController.text}");
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

              CustomSnackBar().showSnackBar(
                  context: context,
                  content: "Sign Up Successful",
                  backgroundColor: Colors.red);
              isLoading.value = false;
              Get.offAll(const LoginScreen());
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
           }else{
              isLoading.value = false;
           }
        }catch(e){
           print("Error : $e");
        }
      }
   }

   // FocusNode focusNode = FocusNode();
// }
