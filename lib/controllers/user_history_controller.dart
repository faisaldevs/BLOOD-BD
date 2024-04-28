import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/models/blood_donate_history_model.dart';
import 'package:blood_bd/models/blood_request_history_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/app_routes.dart';

class HistoryController extends GetxController {
  RxBool isVisible = false.obs;

  visibility() {
    isVisible.value = !isVisible.value;
  }

  var token = GetStorage().read("token");

  Future<BloodRequestHistoryModel> getHistoryRequest() async {
    print("pressed.............1");
    try {
      // String appUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
      // var res = await http.get(
      //   Uri.parse(appUrl),
      //   headers: {
      //
      //   },
      // );
      var res = await http.get(
        Uri.parse(ApiUrls.bloodRequestGet),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
      );
      // print(res.statusCode);
      // print(res.body);

      if (res.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        return BloodRequestHistoryModel.fromJson(responseData);
      }else if (res.statusCode == 404) {
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      }  else {
        print(res.statusCode);
        print(res.body);
        throw Exception('Failed to load blood request notification');
      }

      // var jsonDataDecoded = json.decode(res.body);
      // var dataList = jsonDataDecoded['data'];
      // // print("------------"+dataList.toString());
      //
      // List data = dataList['data'] as List;

      // if (res.statusCode == 200) {
      //   // print("-----data-------" + data.toString());
      //   print(res.statusCode);
      //   // print("pressed.............");
      //   return data.map((e) {
      //     final map = e as Map<String, dynamic>;
      //     return BloodRequestHistoryModel(
      //       patientsName: map["patients_name"],
      //       bloodGroup: map["blood_group"],
      //       amountBag: map["amount_bag"],
      //       date: map["date"],
      //       time: map["time"],
      //       healthIssue: map["health_issue"],
      //       hospitalName: map["hospital_name"],
      //       district: map["district"],
      //       division: map["division"],
      //       union: map["upazila"],
      //       upazila: map["union"],
      //       address: map["address"],
      //       contactPersonName: map["contact_person_name"],
      //       contactPersonPhone: map["contact_person_phone"],
      //       note: map["note"],
      //     );
      //   }).toList();
      // } else {
      //   print("failed code${res.statusCode}");
      //   print("failed body${res.body}");
      // }
    } catch (e) {
      print("---$e");
    }
    throw Exception("Loading failed !!!");
  }

  Future<BloodDonateHistoryModel> getHistoryDonate() async {
    print("pressed.......1");
    print(token);
    try {
      // String appUrl = "https://starsoftjpn.xyz/api/auth/blood-donor";
      // var res = await http.get(
      //   Uri.parse(appUrl),
      //   headers: {
      //
      //   },
      // );
      var res = await http.get(
        Uri.parse("https://starsoftjpn.xyz/api/auth/accepted-blood-request-notification"),
        headers: {
          "Accept": "application/json",
          "Authorization": token,
        },
      );
      print("pressed.............2");
      print(res.statusCode);

      print(res.body);

      var body = json.decode(res.body);

      if (res.statusCode == 200) {
        return BloodDonateHistoryModel.fromJson(body);
      }else if (res.statusCode == 404) {
        GetStorage().erase();
        Get.offAllNamed(welcomePage);
      }  else {
        print("failed code${res.statusCode}");
        print("failed body${res.body}");
      }
    } catch (e) {
      print("---$e");
    }
    throw Exception("Loading failed !!!");
  }
}
