import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   late final String division;
   late final String district;
   late final String thana;
   late final String bloodType;

  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController genderController = TextEditingController();

  Future<void> onPageTap() async {
    await Get.dialog(const Text("data"));
  }


  findDonor(){

    if(formKey.currentState!.validate()){

      print(division);
      print(district);
      print(thana);
      print(bloodType);
    }

  }


  //------------------Nav bar----------------

   RxInt selectedItem = 0.obs;

  navbarFunction(index){
    selectedItem.value = index;
  }

}
