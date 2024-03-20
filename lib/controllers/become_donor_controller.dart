import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BecomeDonorController extends GetxController {
   GetStorage sdStorage = GetStorage();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController patientNameController = TextEditingController();
  late final String bloodType;
  late final String bloodAmount;
  late final String healthIssue;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController contactParsonNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  searchDonor() {
    print("pressend");
    // if (formKey.currentState!.validate()) {
      var patientName = patientNameController.text;
      var date = dateController.text;
      var time = timeController.text;
      var contactParsonPhone = numberController.text;
      var patientAddress = addressController.text;
      var contactParsonName = contactParsonNameController.text;

      sdStorage.write("patientName", patientName);
      sdStorage.write("bloodType", bloodType);
      sdStorage.write("bloodAmount", bloodAmount);
      sdStorage.write("healthIssue", healthIssue);
      sdStorage.write("date", date);
      sdStorage.write("time", time);

      sdStorage.write("patientAddress", patientAddress);
      sdStorage.write("contactParsonName", contactParsonName);
      sdStorage.write("contactParsonPhone", contactParsonPhone);

      Get.snackbar("Received", "Donor Data Received");
      print("object");
    }
  }
// }
