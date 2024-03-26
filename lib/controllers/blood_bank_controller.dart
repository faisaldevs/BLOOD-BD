import 'dart:convert';

import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/models/blood_bank_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BloodBankController extends GetxController {
  Future<List> getBloodBankData() async {
    try {
      var res = await http.get(
        Uri.parse(ApiUrls.bloodBankGet),
      );
      var jsonDataDecoded = json.decode(res.body);

      List data = jsonDataDecoded['data'] as List;
      if (kDebugMode) {
        print("Data : $data");
      }
      if (res.statusCode == 200) {
        return data.map((e) {
          final map = e as Map<String, dynamic>;
          return BloodBankModel(
            id: map["id"],
            clubName: map["club_name"],
            contactPerson: map["contact_person"],
            phones: map["phones"],
            district: map["district"],
            division: map["division"],
            union: map["upazila"],
            upazila: map["union"],
            address: map["address"],
          );
        }).toList();
      } else {
        if (kDebugMode) {
          print("failed code${res.statusCode}");
        }
        if (kDebugMode) {
          print("failed body${res.body}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error : $e");
      }
    }
    throw "";
  }
}
