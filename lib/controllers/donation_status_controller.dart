import 'dart:convert';
import 'package:blood_bd/models/donation_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DonationStatusController extends GetxController{
  var token  = GetStorage().read("token");

  Future<DonationModel> getDonationList()async{
    print("pressed.............1");
    try{
      print(token);
      final response = await http.get(Uri.parse("https://starsoftjpn.xyz/api/auth/blood-request-notification"),
        headers: {
        "Accept" : "application/json",
        "Authorization" : token,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        return DonationModel.fromJson(responseData);
      } else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to load blood request notification');
      }

    }catch(e){
      print(e);
    }

    throw Exception("Loading failed !!!");
  }


  sentStatus(){

  }

}