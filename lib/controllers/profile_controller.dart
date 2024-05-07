import 'dart:convert';
import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/screens/profile/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../screens/blood_request_donor/become_donor_page.dart';
import '../screens/profile/update_profile.dart';
import '../utils/app_routes.dart';

class ProfileController extends GetxController {
  String name = "";
  String number = "";
  String status = "";
  String bloodType = "";
  RxString blood = "".obs;
  RxString gender = "".obs;
  RxString address = "".obs;
  RxBool loading = false.obs;



  String token = GetStorage().read("token");

  profileData() async {
    loading.value = true;
    print("object");
    print(token);
    
    try {
      // loading.value = true;
      // String appUrl = "https://starsoftjpn.xyz/api/auth/profile";

      var res = await http.get(
        Uri.parse(ApiUrls.profileGet),
        headers: {
          "Accept" : "application/json",
          "Authorization" : token,
        }
      );

      if(res.statusCode == 200){
        var jsonBody = jsonDecode(res.body);
        var body = jsonBody["data"];
        name = body["name"].toString();
        number = body["phone"].toString();
        status = body["donor_status"].toString();
        // status = body["blood_group"].toString();
        GetStorage().write("StatusValue", status);
        // number.value = body["phone"];
        // number.value = body["phone"];
        // loading.value= false;
        print(name);
        print(number);
        print(status);
        loading.value = false;
        Get.to(const ProfilePage());
      }else if (res.statusCode == 404) {
        loading.value = false;
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      }

      print(res.statusCode);
      print(res.body.toString());
    } catch (e) {
      loading.value = false;
      // loading.value = false;
      print("Error : $e");
    }
  }

  // var status12 = GetStorage().read("statusValue");

   RxBool switchValue = true.obs;

  activeStatus(bool value) async {
    // print(status12);
    switchValue.value = !value;
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
     if (res.statusCode == 404) {
      GetStorage().erase();
      Get.offAllNamed(welcomePage);
    }
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
     if (res1.statusCode == 404) {
    GetStorage().erase();
    Get.offAllNamed(welcomePage);
    }
      print(res1.statusCode);
      print(res1.body);
    }

    // Get.snackbar(
    //   "Active status ",
    //   "Active status on",
    //   maxWidth: Get.width * .55,
    //   duration: const Duration(milliseconds: 800),
    //   snackPosition: SnackPosition.BOTTOM,
    //   colorText: Colors.red,
    //   icon: switchValue.value
    //       ? const Icon(
    //     Icons.check_circle,
    //     color: Colors.green,
    //   )
    //       : const Icon(
    //     Icons.check_circle,
    //   ),
    //   titleText: const Text("Active status ",
    //       style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
    //   messageText: switchValue.value
    //       ? RichText(
    //       text: const TextSpan(children: [
    //         TextSpan(
    //           text: "Active status  ",
    //           style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 16,
    //               color: Colors.black),
    //         ),
    //         TextSpan(
    //           text: "on",
    //           style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 20,
    //               color: Colors.green),
    //         )
    //       ]))
    //       : RichText(
    //     text: const TextSpan(
    //       children: [
    //         TextSpan(
    //           text: "Active status  ",
    //           style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 16,
    //               color: Colors.black),
    //         ),
    //         TextSpan(
    //           text: "off",
    //           style: TextStyle(
    //             fontWeight: FontWeight.w500,
    //             fontSize: 20,
    //             color: Colors.black,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }


  donorValidate()async{
    loading.value = true;
    try{
      var res = await http.get(
          Uri.parse(ApiUrls.profileGet),
          headers: {
            "Accept" : "application/json",
            "Authorization" : token,
          }
      );


      if(res.statusCode == 200){
        var body  = jsonDecode(res.body);
        var data = body["data"];

        String status = data["donor_profile_status"].toString();
        if (kDebugMode) {
          print("Profile Donor: $status");
        }

        loading.value = false;
        if(status == 0.toString()){
          Get.to(const BecomeDonor());
        }else{
          // Get.to( const DonorProfile());
          // Get.to(const BecomeDonor());
          // donorProfile();
          Get.rawSnackbar(
              messageText: const Text(
                  'You are already a Donor..!!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
              ),
              isDismissible: true,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red[400]!,
              icon : const Icon(Icons.settings, color: Colors.white, size: 35,),
              margin: EdgeInsets.zero,
              snackStyle: SnackStyle.GROUNDED
          );

        }

      } else if (res.statusCode == 404) {
        loading.value = false;
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      } else{
        loading.value = false;
        print(res.statusCode);
        print(res.body);
      }

    }catch(e){
      loading.value = false;
      print("Error : $e");
    }
  }



editProfile()async{

  try {
    loading.value = true;

    var res = await http.get(
        Uri.parse(ApiUrls.profileGet),
        headers: {
          "Accept" : "application/json",
          "Authorization" : token,
        }
    );

    if(res.statusCode == 200){
      var jsonBody = jsonDecode(res.body);
      var body = jsonBody["data"];

      var userName = body["name"];




      loading.value = false;
      Get.to(EditProfile());
    }else if (res.statusCode == 404) {
      loading.value = false;
      GetStorage().erase();
      Get.offAllNamed(welcomePage);
    }

    print(res.statusCode);
    print(res.body.toString());
  } catch (e) {
    loading.value = false;
    print("Error : $e");
  }




}


}
