import 'dart:math';

import 'package:blood_bd/screens/user_auth/login_screen/login_screen.dart';
import 'package:get/get.dart';

import '../screens/user_auth/signup_screen/signup_screens.dart';

class WelcomeController extends GetxController {
  signupBtn() async {
    Get.to(SignupScreen());
  }

  loginBtn() async {
    Get.to( LoginScreen());
  }

  List<String> imageUrls = [
    "assets/welcome_page/bd1.png",
    "assets/welcome_page/bd2.png",
    "assets/welcome_page/bd3.png",
    "assets/welcome_page/bd4.png",
  ];

  RxInt currentIndex = 1.obs;

  void changeBackground() {
    currentIndex.value = Random().nextInt(imageUrls.length);
  }
}
