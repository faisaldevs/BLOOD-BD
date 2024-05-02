import 'dart:convert';
import 'package:blood_bd/app_notifications/notification_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../api/api_links.dart';
class NotificationCallPage{

  donorResponse(deviceToken,status)async{
    print("Donate Blood");
    try {
      var res = await http.get(
          Uri.parse(ApiUrls.profileGet),
          headers: {
            "Accept" : "application/json",
            "Authorization" : GetStorage().read("token").toString(),
          }
      );
      print(res.statusCode);
      if(res.statusCode == 200){
        var jsonBody = jsonDecode(res.body);
        var body = jsonBody["data"];
        var donorStatus = body["donor_profile_status"];
        var donorName = body["name"];
        print("Status : $donorStatus");

        NotificationHelper().customNotificationFeedback(deviceToken, status, donorName);

      }

}catch(e){

    }

  }
}

