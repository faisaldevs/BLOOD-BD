import 'dart:convert';
import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/models/search_requested_donor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../app_notifications/notification_helper.dart';
import '../screens/blood_request_donor/request_blood/request_blood_filter_page.dart';
import '../screens/home_screen/home_screen.dart';
import '../utils/app_routes.dart';

class RequestBloodController extends GetxController {
  var token = GetStorage().read("token") ?? "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  var bloodType;
  var bloodAmount;
  var healthIssue;
  var division;
  var district;
  var union;
  var thana;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactParsonNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<Map<String, dynamic>> dataList = [];
  RxBool isLoading = false.obs;

  onSaveRqBlood() async {
    // if (formKey.currentState!.validate()) {
      isLoading.value = true;
      print(token);

      print(bloodType);
      print(dateController.text);
      print(timeController.text);
      print(division.toString());
      print(district.toString());
      print(thana.toString());
      print(union.toString());

      try {
        print("validate");
        // String apiUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
        var res = await http.post(
          Uri.parse(ApiUrls.bloodRequestPost),
          headers: {
            "Accept": "application/json",
            "Authorization": token,
          },
          body: {
            "patients_name": patientNameController.text,
            "blood_group": bloodType,
            "amount_bag": bloodAmount.toString(),
            "date": dateController.text,
            "hospital_name": hospitalController.text,
            // "date": "2024-01-06",
            "time": "16:14:00",
            "health_issue": healthIssue,
            "division": division,
            "district": district,
            "upazila": thana,
            "union": "union",
            "address": addressController.text,
            "contact_person_name": contactParsonNameController.text,
            "contact_person_phone": numberController.text,
            "note": noteController.text,
          },
          // body: {
          //   "patients_name": "Faisal",
          //   "blood_group": "A+",
          //   "amount_bag": "1",
          //   // "date": dateController.text,
          //   "date": "2024-01-06",
          //   "time": "16:14:00",
          //   "health_issue": "healthIssue",
          //   "division": "dhaka",
          //   "district": "dhaka",
          //   "hospital_name": "Dhaka",
          //   "upazila": "dhaka",
          //   "union": "dhaka",
          //   "address": "addressController.text",
          //   "contact_person_name": "contactParson",
          //   "contact_person_phone": "01725966666",
          //   "note" : "noteController.text",
          // },
        );

        print(res.statusCode);
        print(res.body);

        if (res.statusCode == 201) {
          var data = jsonDecode(res.body);

          var success = data["success"];
          print(success);
          // var message = data["message"];
          var bloodRequestId = data["blood_request_id"].toString();

          print("bloodRequestId : $bloodRequestId");
          print("bloodType : $bloodType");
          print("bloodAmount : $bloodAmount");
          print("division : $division");
          print("district : $district");

          print("health : $healthIssue");
          print("name : ${patientNameController.text}");
          print("date : $data");
          print("Hospital Name : ${hospitalController.text}");
          print("phone : ${numberController.text}");
          Get.to(FilterPage(
            bloodRequestId: bloodRequestId,
            bloodType: bloodType,
            division: division,
            district: district,
            bloodAmount: bloodAmount,
            healthIssue: healthIssue,
            name: contactParsonNameController.text,
            date: dateController.text,
            hospitalName: hospitalController.text,
            phone: numberController.text,
          ));
          isLoading.value = false;

          // var dataList = data["bloodRDonors"] as List;
          // print(success);
          // print(dataList);
          //
          // if(success == true){
          //
          //   Get.to(FilterPage(bloodRequestId: bloodRequestId, bloodType: "A+", division: "Dhaka", district: "Dhaka",));
          // }

          // print( "res.statusCode");
          // var res1 = await http.post(Uri.parse("https://starsoftjpn.xyz/api/auth/blood-donor-with-search"),
          //     headers: {
          //       "Accept": "application/json",
          //       "Authorization": token,
          //     },
          //     body: {
          //       "blood_group" : "O+",
          //       "division" : "Dhaka",
          //       "district" : "Dhaka",
          //     }
          // );
          //
          // print( res1.statusCode);
          // print( res1.body);
          //
          // var donor = jsonDecode(res1.body);
          // var donorList = donor["data"] as List;
        } else {
          isLoading.value = false;
        }
      } catch (e) {
        isLoading.value = false;
        print("Error : $e");
      }
    // }
  }

  donate(String? donorId, String? deviceToken) async {
    isLoading.value = true;
    print(token);

    print(bloodType);
    print(dateController.text);
    print(timeController.text);
    print(division.toString());
    print(district.toString());
    print(thana.toString());
    print(union.toString());

    try {
      print("validate");
      // String apiUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
      var res = await http.post(
        Uri.parse(ApiUrls.bloodRequestPost),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
        body: {
          "patients_name": patientNameController.text,
          "blood_group": bloodType,
          "amount_bag": bloodAmount.toString(),
          "date": dateController.text,
          "hospital_name": hospitalController.text,
          // "date": "2024-01-06",
          "time": "16:14:00",
          "health_issue": healthIssue,
          "division": division,
          "district": district,
          "upazila": thana,
          "union": "union",
          "address": addressController.text,
          "contact_person_name": contactParsonNameController.text,
          "contact_person_phone": numberController.text,
          "note": noteController.text,
        },
        // body: {
        //     "patients_name": "Test",
        //     "blood_group": "O+",
        //     "amount_bag": "2",
        //     "date": "2024-01-06",
        //     "hospital_name": "hospital name",
        //     // "date": "2024-01-06",
        //     "time": "16:14:00",
        //     "health_issue": "healthIssue",
        //     "division": "division",
        //     "district": "district",
        //     "upazila": "thana",
        //     "union": "union",
        //     "address": "addressController",
        //     "contact_person_name": "name",
        //     "contact_person_phone": "number",
        //     "note": "note",
        // },
      );

      print(res.statusCode);
      print(res.body);

      if (res.statusCode == 201) {
        var data = jsonDecode(res.body);

        var success = data["success"];
        print(success);
        // var message = data["message"];
        var bloodRequestId = data["blood_request_id"].toString();

        print("bloodRequestId : $bloodRequestId");
        print("bloodType : $bloodType");
        print("bloodAmount : $bloodAmount");
        print("division : $division");
        print("district : $district");
        var response = await http.post(
          Uri.parse(ApiUrls.bloodRequestNotificationPost),
          headers: {
            "Accept": "application/json",
            "Authorization": token,
          },
          body: {
            "blood_request_id": bloodRequestId,
            "blood_donor_id": donorId,
            "request_amount_bag": bloodAmount,
            "blood_donor_user_id": "69",
          },
        );

        print(response.statusCode.toString());
        print(response.body);
        if (response.statusCode == 201) {
          print("test_notification");

          // NotificationHelper().sendNotification(deviceToken);
          NotificationHelper().customNotification(
              deviceToken,
              "receiver",
              healthIssue,
              bloodType,
              bloodAmount,
              dateController.text,
              hospitalController.text,
              numberController.text,
              contactParsonNameController.text);

          Get.offAll(HomeScreen());
          isLoading.value = false;
        } else {
          isLoading.value = false;
          print(response.statusCode.toString());
          print(response.body);
        }
        // Get.to(FilterPage(
        //   bloodRequestId: bloodRequestId,
        //   bloodType: bloodType,
        //   division: division,
        //   district: district,
        //   bloodAmount: bloodAmount,
        // ));

        // var dataList = data["bloodRDonors"] as List;
        // print(success);
        // print(dataList);
        //
        // if(success == true){
        //
        //   Get.to(FilterPage(bloodRequestId: bloodRequestId, bloodType: "A+", division: "Dhaka", district: "Dhaka",));
        // }

        // print( "res.statusCode");
        // var res1 = await http.post(Uri.parse("https://starsoftjpn.xyz/api/auth/blood-donor-with-search"),
        //     headers: {
        //       "Accept": "application/json",
        //       "Authorization": token,
        //     },
        //     body: {
        //       "blood_group" : "O+",
        //       "division" : "Dhaka",
        //       "district" : "Dhaka",
        //     }
        // );
        //
        // print( res1.statusCode);
        // print( res1.body);
        //
        // var donor = jsonDecode(res1.body);
        // var donorList = donor["data"] as List;
      }
    } catch (e) {
      isLoading.value = false;
      print("Error : $e");
    }
  }

  Future<DonorSearch> donorSearch() async {
    isLoading.value = true;
    try {
      // String appUrl = "https://starsoftjpn.xyz/api/v1/blood-request";
      var res = await http.post(
          Uri.parse("https://starsoftjpn.xyz/api/auth/blood-donor-with-search"),
          headers: {
            "Accept": "application/json",
            "Authorization": token,
          },
          body: {
            "blood_group": "O+",
            "division": "Dhaka",
            "district": "Dhaka",
          });

      var jsonDataDecoded = json.decode(res.body);
      // List data = jsonDataDecoded['data'] as List;
      if (res.statusCode == 200) {
        if (kDebugMode) {
          print("200-status : ${res.body}");
        }
        isLoading.value = false;

        return DonorSearch.fromJson(jsonDataDecoded);
      } else {
        if (kDebugMode) {
          print("failed code${res.statusCode}");
        }
        if (kDebugMode) {
          print("failed body${res.body}");
        }
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      if (kDebugMode) {
        print("Error : $e");
      }
    }
    throw Exception("Loading failed !!!");
  }

  confirmBlood(
      String bloodRequestId,
      String bloodDonorId,
      String bloodAmount,
      bloodDonorUserId,
      deviceToken,
      healthIssue,
      name,
      date,
      hospitalName,
      phone,
      bloodType) async {
    isLoading.value = true;
    try {
      print("validate");
      print(bloodRequestId);
      print(bloodDonorId);
      print(bloodAmount);
      // String apiUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
      var res = await http.post(
        Uri.parse(ApiUrls.bloodRequestNotificationPost),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
        body: {
          "blood_request_id": bloodRequestId,
          "blood_donor_id": bloodDonorId,
          "request_amount_bag": bloodAmount,
          "blood_donor_user_id": bloodDonorUserId,
        },
      );

      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 201) {
        print("confirm blood");
        Get.rawSnackbar(
            messageText: const Text(
                'Request has been sent..!!',
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

        // NotificationHelper().sendNotification(deviceToken);
        NotificationHelper().customNotification(
            deviceToken,
            "receiver",
            healthIssue,
            bloodType,
            bloodAmount,
            date,
            hospitalName,
            phone,
            name);
        isLoading.value = false;
      } else if (res.statusCode == 404) {
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print("Error : $e");
    }
  }

  urgentRequest() {}
}
