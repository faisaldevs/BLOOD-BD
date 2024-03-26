import 'package:blood_bd/api/api_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/app_routes.dart';

class UpdateProfileController extends GetxController {

  String token = GetStorage().read("token") ?? "";
  String name = GetStorage().read("name") ?? "";
  String phone = GetStorage().read("phone") ?? "";
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  late final String bloodType;
  late final String gender;
  late final String division;
  late final String district;
  late final String upazila;
  late final String union;


  updateProfile() async {
    print("object");
   try{
     String appUri = "https://starsoftjpn.xyz/api/auth/update-profile";
     var response = await http.post(
       Uri.parse(ApiUrls.profileUpdatePost),
       headers: {
         "Accept" : "application/json",
         "Authorization" : token,
       },
       body: {
         "name" : "Faisal Ahamed",
         "phone" : "01903440069",
         "email" : "faisal.ah123@gmail.com",
       },
     );

     if(response.statusCode == 200){
       Get.toNamed(home);
     }
     print(response.statusCode);
     print(response.body);
   }catch(e){
     print(e);
   }

    // if(response.statusCode == 200)
  }
}

