import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/app_routes.dart';

class UpdateProfileController extends GetxController {
  String token = GetStorage().read("token") ?? "";

  // String name = GetStorage().read("name") ?? "";
  // String phone = GetStorage().read("phone") ?? "";
  GlobalKey<FormState> profileUpdateKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  var bloodType;
  var gender;
  var division;
  var district;
  var upazila;
  var union;

  RxBool Loading = false.obs;

  updateProfile(name,date,weight,address,bloodType1,gender1,division1,district1,upazila1,) async {
    print(nameController.text);
    print(dateController.text);
    print(weightController.text);
    print(addressController.text);
    print(bloodType);
    print(gender);
    print(division);
    print(district);
    print(upazila);

  // if(nameController.text == ""  ){
    try {
      Loading.value = true;
      // String appUri = "https://starsoftjpn.xyz/api/auth/update-profile";
      var response = await http.post(
        Uri.parse(ApiUrls.profileUpdatePost),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
        body: {
          "name": nameController.text == "" ? name: nameController.text,
          // "phone" : "01903440069",
          // "email" : "faisal.ah123@gmail.com",
          "blood_group": bloodType == null? bloodType1: bloodType,
          "gender": gender == null? gender1: gender,
          "weight": weightController.text == "" ? weight: weightController.text,
          "division": division == null? division1: division,
          "district": district == null? district1: district,
          "upazila": upazila == null? upazila1: upazila,
          "address": addressController.text == "" ? address: addressController.text,
        },
      );

      print(response.statusCode);
      print(response.body);
      var body = jsonDecode(response.body);

      var success = body["success"];
      print(success);
      print(success.runtimeType);

      if (response.statusCode == 200 && success == true) {
        // Get.toNamed(home);
        Get.offAllNamed(home);
        Loading.value = false;
        Get.rawSnackbar(
            messageText: const Text(
                'Profile Update  Successful !!!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                )
            ),
            isDismissible: true,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red[400]!,
            icon : const Icon(Icons.done_all, color: Colors.white, size: 35,),
            margin: EdgeInsets.zero,
            snackStyle: SnackStyle.GROUNDED
        );

      } else if (response.statusCode == 404) {
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
        Loading.value = false;
      } else {
        print(response.statusCode);
        print(response.body);
        Loading.value = false;
      }
    } catch (e) {
      Loading.value = false;
      print("Error : $e");
    }
  // }

    // if(response.statusCode == 200)
  }
}
