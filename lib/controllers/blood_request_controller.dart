import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/blood_request_model.dart';


class BloodRequestController extends GetxController{


  RxBool isVisible = false.obs;

  visibility(){
    isVisible.value = !isVisible.value;
  }


  Future<List<RequestBloodModel>> getRequestData() async {
    print("pressed.............1");
    try {
      String appUrl = "https://starsoftjpn.xyz/api/v1/blood-request";
      var res = await http.get(Uri.parse(appUrl));

      print(res.statusCode);
      // print(res.body);

      var jsonDataDecoded = json.decode(res.body);
      var dataList = jsonDataDecoded['data'];
      // print("------------"+dataList.toString());

      List data = dataList['data'] as List;
      if (res.statusCode == 200) {
        print("-----data-------"+data.toString());
        print(res.statusCode);
        // print("pressed.............");
        return data.map((e) {
          final map = e as Map<String, dynamic>;
          return RequestBloodModel(
            patientsName: map["patients_name"],
            bloodGroup: map["blood_group"],
            amountBag : map["amount_bag"],
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
            // user: map["user"],
          );
        }).toList();

      } else {
        print("failed code${res.statusCode}");
        print("failed body${res.body}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Loading failed !!!");
  }


}