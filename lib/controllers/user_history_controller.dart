import 'dart:convert';

import 'package:blood_bd/models/blood_donate_history_model.dart';
import 'package:blood_bd/models/blood_request_history_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HistoryController extends GetxController {

  var token = GetStorage().read("token");

  Future<List<BloodRequestHistoryModel>> getHistoryRequest() async {
    print("pressed.............1");
    try {
      String appUrl = "https://starsoftjpn.xyz/api/auth/blood-request";
      // var res = await http.get(
      //   Uri.parse(appUrl),
      //   headers: {
      //
      //   },
      // );
      var res = await http.get(Uri.parse(appUrl),headers: {
        "Accept" : "application/json",
        "Authorization" : token,
      },);
      print("pressed.............2");
      print(res.statusCode);

      print(res.body);

      var jsonDataDecoded = json.decode(res.body);
      var dataList = jsonDataDecoded['data'];
      // print("------------"+dataList.toString());

      List data = dataList['data'] as List;

      if (res.statusCode == 200) {
        // print("-----data-------" + data.toString());
        print(res.statusCode);
        // print("pressed.............");
        return data.map((e) {
          final map = e as Map<String, dynamic>;
          return BloodRequestHistoryModel(
            patientsName: map["patients_name"],
            bloodGroup: map["blood_group"],
            amountBag: map["amount_bag"],
            date: map["date"],
            time: map["time"],
            healthIssue: map["health_issue"],
            hospitalName: map["hospital_name"],
            district: map["district"],
            division: map["division"],
            union: map["upazila"],
            upazila: map["union"],
            address: map["address"],
            contactPersonName: map["contact_person_name"],
            contactPersonPhone: map["contact_person_phone"],
            note: map["note"],
          );
        }).toList();
      } else {
        print("failed code${res.statusCode}");
        print("failed body${res.body}");
      }
    } catch (e) {
      print("---"+e.toString());
    }
    throw Exception("Loading failed !!!");
  }

  Future<List<BloodDonateHistory>> getHistoryDonate() async {
    print("pressed.............1");
    try {
      String appUrl = "https://starsoftjpn.xyz/api/auth/blood-donor";
      // var res = await http.get(
      //   Uri.parse(appUrl),
      //   headers: {
      //
      //   },
      // );
      var res = await http.get(Uri.parse(appUrl),headers: {
        "Accept" : "application/json",
        "Authorization" : token,
      },);
      print("pressed.............2");
      print(res.statusCode);

      print(res.body);

      var jsonDataDecoded = json.decode(res.body);
      var dataList = jsonDataDecoded['data'];
      // print("------------"+dataList.toString());

      List data = dataList['data'] as List;

      if (res.statusCode == 200) {
        // print("-----data-------" + data.toString());
        print(res.statusCode);
        // print("pressed.............");
        return data.map((e) {
          final map = e as Map<String, dynamic>;
          return BloodDonateHistory(
            // patientsName: map["patients_name"],
            bloodGroup: map["blood_group"],
            amountBag: map["amount_bag"],
            // date: map["date"],
            // time: map["time"],
            healthIssue: map["health_issue"],
            // hospitalName: map["hospital_name"],
            district: map["district"],
            division: map["division"],
            union: map["upazila"],
            upazila: map["union"],
            address: map["address"],
            contactPersonName: map["contact_person_name"],
            contactPersonPhone: map["contact_person_phone"],
            // note: map["note"],
          );
        }).toList();
      } else {
        print("failed code${res.statusCode}");
        print("failed body${res.body}");
      }
    } catch (e) {
      print("---"+e.toString());
    }
    throw Exception("Loading failed !!!");
  }

}
