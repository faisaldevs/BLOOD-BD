import 'dart:convert';
import 'package:blood_bd/api/api_links.dart';
import 'package:blood_bd/screens/profile/profile_page.dart';
import 'package:get/get.dart';
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
      // String appUrl = "https://starsoftjpn.xyz/api/auth/profile";

      var res = await http.get(
        Uri.parse(ApiUrls.profileGet),
        headers: {
          "Accept" : "application/json",
          "Authorization" : token,
        }
      );

      if(res.statusCode == 200){
        var jsonBody = jsonDecode(res.body);
        var body = jsonBody["data"];
        name = body["name"];
        number = body["phone"];
        status = body["donor_status"];
        GetStorage().write("StatusValue", status);
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

  // var status12 = GetStorage().read("statusValue");

   RxBool switchValue = true.obs;

  activeStatus(bool value) async {
    // print(status12);
    switchValue.value = !value;
    // String appUrl = "https://starsoftjpn.xyz/api/auth/update-donor-status";
    String appUrl = ApiUrls.donorStatusUpdatePost;

    if (value == true) {
      print("object");

      try {
        var res = await http.post(
          Uri.parse(appUrl),
          headers: {"Authorization": token},
          body: {"donor_status": 1.toString()},
        );
        print(res.statusCode);
        print(res.body);
      } catch (e) {
        print(e);
      }
    } else {
      print("null");
      var res1 = await http.post(
        Uri.parse(appUrl),
        headers: {"Authorization": token},
        body: {"donor_status": 0.toString()},
      );
      print(res1.statusCode);
      print(res1.body);
    }

    // Get.snackbar(
    //   "Active status ",
    //   "Active status on",
    //   maxWidth: Get.width * .55,
    //   duration: const Duration(milliseconds: 800),
    //   snackPosition: SnackPosition.BOTTOM,
    //   colorText: Colors.red,
    //   icon: switchValue.value
    //       ? const Icon(
    //     Icons.check_circle,
    //     color: Colors.green,
    //   )
    //       : const Icon(
    //     Icons.check_circle,
    //   ),
    //   titleText: const Text("Active status ",
    //       style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
    //   messageText: switchValue.value
    //       ? RichText(
    //       text: const TextSpan(children: [
    //         TextSpan(
    //           text: "Active status  ",
    //           style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 16,
    //               color: Colors.black),
    //         ),
    //         TextSpan(
    //           text: "on",
    //           style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 20,
    //               color: Colors.green),
    //         )
    //       ]))
    //       : RichText(
    //     text: const TextSpan(
    //       children: [
    //         TextSpan(
    //           text: "Active status  ",
    //           style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 16,
    //               color: Colors.black),
    //         ),
    //         TextSpan(
    //           text: "off",
    //           style: TextStyle(
    //             fontWeight: FontWeight.w500,
    //             fontSize: 20,
    //             color: Colors.black,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }












}
