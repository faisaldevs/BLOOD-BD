import 'dart:convert';

import 'package:blood_bd/screens/profile/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {

  RxString name = "".obs;
  RxString number = "".obs;
  RxString blood = "".obs;
  RxString gender = "".obs;
  RxString address = "".obs;



  String token = GetStorage().read("token");
  profileData() async {
    print("object");

    try{
      String appUrl = "https://starsoftjpn.xyz/api/auth/profile";
      var res = await http.get(
        Uri.parse(appUrl),
        headers: {
          "Accept" : "application/json",
          "Authorization" : token,
        },
      );

      if(res.statusCode == 200){

        // var body = jsonDecode(res.body);
        //
        // name.value = body["name"];
        // number.value = body["phone"];
        // number.value = body["phone"];
        // number.value = body["phone"];

        print("-------"+name.value.toString());

        print(res.statusCode);
        print(res.body);

        await Duration(milliseconds: 300);
        await Get.to(()=> const ProfilePage());

      }else{
        print(res.statusCode);
        print(res.body);
      }

    }catch(e){
      print(e);
    }
  }
}
