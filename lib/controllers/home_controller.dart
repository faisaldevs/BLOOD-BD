import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../api/api_links.dart';
import '../utils/app_routes.dart';

class HomeController extends GetxController {


   late final String division;
   late final String district;
   late final String thana;
   late final String bloodType;
   String token = GetStorage().read("token");

  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController genderController = TextEditingController();
   profileData() async {
     print("object");
     print(token);

     try {
       var res = await http.get(
           Uri.parse(ApiUrls.profileGet),
           headers: {
             "Accept" : "application/json",
             "Authorization" : token,
           }
       );
      if (res.statusCode == 404) {
         GetStorage().erase();
         Get.offAllNamed(welcomePage);
       }

       print(res.statusCode);
       print(res.body.toString());
     } catch (e) {
       print("Error : $e");
     }
   }

  Future<void> onPageTap() async {
    await Get.dialog(const Text("data"));
  }


  // findDonor(){
  //
  //   if(formKey.currentState!.validate()){
  //
  //     print(division);
  //     print(district);
  //     print(thana);
  //     print(bloodType);
  //   }
  //
  // }


  //------------------Nav bar----------------

   RxInt selectedItem = 0.obs;

  navbarFunction(index){
    selectedItem.value = index;
  }

}
