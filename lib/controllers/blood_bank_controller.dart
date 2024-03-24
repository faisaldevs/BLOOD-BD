import 'dart:convert';

import 'package:blood_bd/models/blood_bank_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BloodBankController extends GetxController {


 Future<List> getBloodBankData() async {
try{
  var res = await http.get(
    Uri.parse("https://starsoftjpn.xyz/api/v1/club"),
  );

  print(res.statusCode);
  print(res.body);

  var jsonDataDecoded = json.decode(res.body);
  var dataList = jsonDataDecoded['data'];
  // print("------------"+dataList.toString());

  List data = dataList['data'] as List;
  print(data);
  if (res.statusCode == 200) {
    print("-----data-------"+data.toString());
    print(res.statusCode);
    // print("pressed.............");
    return data.map((e) {
      final map = e as Map<String, dynamic>;
      return BloodBankModel(
        id: map["id"],
        clubName: map["club_name"],
        district: map["district"],
        division: map["division"],
        union: map["upazila"],
        upazila: map["union"],
        address: map["address"],

      );
    }).toList();

  } else {
    print("failed code${res.statusCode}");
    print("failed body${res.body}");
  }
}catch(e){
  print(e);
}
throw "";

  }
}
