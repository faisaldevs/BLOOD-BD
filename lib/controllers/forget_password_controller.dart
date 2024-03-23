import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController newPassword = TextEditingController();
   TextEditingController confirmPassword = TextEditingController();

  forgetValidation() {
    if(formKey.currentState!.validate()){
      if (kDebugMode) {
        print("succeed");
      }
    }else{
      if (kDebugMode) {
        print("failed");
      }
    }
  }
}
