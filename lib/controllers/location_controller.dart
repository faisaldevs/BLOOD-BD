import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class LocationController extends GetxController{


  RxBool fetching = false.obs;
  RxList<String> divisions = <String>[].obs;
  RxList<String> districts = <String>[].obs;
  RxList<String> thanas = <String>[].obs; // New list for thanas
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedThana; // New variable for selected thana

  Future<void> fetchDivisions() async {
    fetching.value = true;
    try {
      final response =
      await http.get(Uri.parse("https://starsoftjpn.xyz/api/v1/division"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
          divisions.value = jsonData['data']
              .map<String>((division) => division['division'].toString())
              .toList();
      } else {
      fetching.value = false;
        throw Exception('Failed to load divisions: ${response.statusCode}');
      }
    } catch (e) {
      fetching.value = false;
      throw Exception('Failed to load divisions: $e');
    }

  }

  Future<void> fetchDistricts(int divisionId) async {
    try {
      final response = await http.get(
          Uri.parse("https://starsoftjpn.xyz/api/v1/district/$divisionId"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
          final uniqueDistricts = jsonData['data']
              .map<String>((district) => district['district'].toString())
              .toSet()
              .toList();
          districts.value = uniqueDistricts;
      } else {
        throw Exception('Failed to load districts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load districts: $e');
    }
  }

  Future<void> fetchThanas(int districtId) async {
    try {
      final response = await http
          .get(Uri.parse("https://starsoftjpn.xyz/api/v1/thana/$districtId"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

          final uniqueThanas = jsonData['data']
              .map<String>((thana) => thana['thana'].toString())
              .toSet()
              .toList();
          thanas.value = uniqueThanas;

      } else {
        throw Exception('Failed to load thanas: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load thanas: $e');
    }
  }
}