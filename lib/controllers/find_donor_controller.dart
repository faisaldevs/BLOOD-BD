import 'dart:convert';
import 'package:blood_bd/models/find_donor_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../api/api_links.dart';

class FindDonorController extends GetxController{

  var token = GetStorage().read("token");

  Future<FindDonorModel> getFindDonor(String bloodType,String division,String district,) async {
    print("Calling Api...");
    print(bloodType);
    print(division);
    print(district);
    try {
      var res = await http.post(Uri.parse(ApiUrls.bloodDonorWithSearchPost),headers: {
        "Accept" : "application/json",
        "Authorization" : token,
      },
      body: {
        "blood_group" : bloodType,
        "division" : division,
        "district" : district,
      }
      );
      print("Calling Api...successes");
      print(res.statusCode);
      print(res.body);


      if (res.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        print(responseData);
        return FindDonorModel.fromJson(responseData);
      } else {
        print(res.statusCode);
        print(res.body);
        throw Exception('Failed to load blood request notification');
      }
    } catch (e) {
      print("---$e");
    }
    throw Exception("Loading failed !!!");
  }
}