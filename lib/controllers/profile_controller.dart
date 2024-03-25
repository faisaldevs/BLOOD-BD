import 'dart:convert';
import 'package:blood_bd/screens/profile/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  String name = "";
  String number = "";
  String status = "";
  RxString blood = "".obs;
  RxString gender = "".obs;
  RxString address = "".obs;
  // RxBool loading = false.obs;

  String token = GetStorage().read("token");

  profileData() async {
    print("object");
    print(token);

    try {
      // loading.value = true;
      String appUrl = "https://starsoftjpn.xyz/api/auth/profile";

      var res = await http.get(
        Uri.parse(appUrl),
        headers: {
          "Accept" : "application/json",
          "Authorization" : token,
        }
      );

      if(res.statusCode == 200){
        var body = jsonDecode(res.body);

        name = body["name"];
        number = body["phone"];
        status = body["donor_status"];
        // number.value = body["phone"];
        // number.value = body["phone"];
        // loading.value= false;
        print(name);
        print(number);
        print(status);
        Get.to(const ProfilePage());
      }

      print(res.statusCode);
      print(res.body.toString());
    } catch (e) {
      // loading.value = false;
      print("Error : $e");
    }
  }
}
