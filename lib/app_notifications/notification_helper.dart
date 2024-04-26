import 'dart:convert';

import 'package:http/http.dart' as http;

class NotificationHelper{


  sendNotification(deviceToken)async{
    print("sent notification");
    var body = {
      "to": deviceToken,
      "notification": {
        "body": "test body",
        "title": "test title"
      },
      "data" : {
        "routeId": 6
      }
    };
    var serverKey = "key=AAAA7XPIygM:APA91bG7SzjFPfXGJDbC26m_6ZDyf3qxPJX81i6t6CiO5Lgh0RlV6rz80f6wyfagmVr2o1RI2ZFIBQf5SfAZ5wI0ll78MhBD7ijI3yQNW1AHRJWvoLAcz-hmHl4eSbalnDam6MGs0k4q";
    var api = "https://fcm.googleapis.com/fcm/send";

    try{
      print("object");
      var res12 = await http.post(Uri.parse(api),
        headers: {
          "Content-Type" : "application/json",
          "Authorization" : serverKey,
        },
        body: jsonEncode(body),
      );
      print(res12.statusCode);
      print(res12.body);
      // if(res == 201){
      //   print("Device token was sent..!!");
      //   print(res.statusCode);
      //   print(res.body);
      // }
    }catch(e){
      print("Error : $e");
    }
  }

}