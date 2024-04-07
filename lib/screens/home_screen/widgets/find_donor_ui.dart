import 'dart:convert';
import 'package:blood_bd/controllers/find_donor_controller.dart';
import 'package:blood_bd/controllers/location_controller.dart';
import 'package:blood_bd/data_list/data_list.dart';
import 'package:blood_bd/screens/home_screen/widgets/find_donor_list.dart';
import 'package:blood_bd/screens/home_screen/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import 'find_button.dart';

class FindDonorUi extends StatefulWidget {
  const FindDonorUi({super.key});

  @override
  State<FindDonorUi> createState() => _FindDonorUiState();
}

class _FindDonorUiState extends State<FindDonorUi> {
  final LocationController controller = Get.put(LocationController());
final cnt = Get.put(FindDonorController());

String bloodType = "";
String division = "";
String district = "";

  bool loading = false;

  List<String> divisions = [];
  List<String> districts = [];
  List<String> thanas = []; // New list for thanas
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedThana; // New variable for selected thana

  Future<void> fetchDivisions() async {
    // signupController.fetching.value = true;
    loading = true;
    try {
      final response =
          await http.get(Uri.parse("https://starsoftjpn.xyz/api/v1/division"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          divisions = jsonData['data']
              .map<String>((division) => division['division'].toString())
              .toList();
        });
        // signupController.fetching.value = false;
      } else {
        loading = false;
        // signupController.fetching.value = false;
        throw Exception('Failed to load divisions: ${response.statusCode}');
      }
    } catch (e) {
      loading = false;
      // signupController.fetching.value = false;
      throw Exception('Failed to load divisions: $e');
    }
  }

  Future<void> fetchDistricts(int divisionId) async {
    try {
      final response = await http.get(
          Uri.parse("https://starsoftjpn.xyz/api/v1/district/$divisionId"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          final uniqueDistricts = jsonData['data']
              .map<String>((district) => district['district'].toString())
              .toSet()
              .toList();
          districts = uniqueDistricts;
        });
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
        setState(() {
          final uniqueThanas = jsonData['data']
              .map<String>((thana) => thana['thana'].toString())
              .toSet()
              .toList();
          thanas = uniqueThanas;
        });
      } else {
        throw Exception('Failed to load thanas: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load thanas: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDivisions();
  }

  inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      fillColor: AppTheme.textFieldColor,
      filled: true,
      contentPadding: const EdgeInsets.only(left: 12),
      counterStyle: const TextStyle(fontWeight: FontWeight.bold),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none,
      ),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide.none),
      labelStyle: TextStyle(
        color: AppTheme.textColorRed,
      ),
      hintStyle: TextStyle(
        color: AppTheme.textColorRed,
      ),
    );
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'Blood Group',
                  dropDownList: DataList.bloodListData,
                  onChanged: (value) {
                    bloodType = value;
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFieldApi(
                  value: selectedDivision,
                  label: "Select Division",
                  onChanged: (newValue) {
                    division = newValue;
                    setState(() {
                      selectedDivision = newValue;
                      selectedDistrict = null;
                      districts.clear();
                      fetchDistricts(divisions.indexOf(selectedDivision!) + 1);
                    });
                  },
                  items: divisions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.red, fontSize: 18.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextFieldApi(
                label: "Select District",
                value: selectedDistrict,
                onChanged: (newValue) {
                  district = newValue;
                  // signupController.district = newValue;
                  setState(() {
                    selectedDistrict = newValue;
                    selectedThana = null; // Reset selected thana
                    fetchThanas(districts.indexOf(selectedDistrict!) + 1);
                  });
                },
                items: districts.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          FindDonorBtn(
            onPressed: () {
             if(bloodType != "" && division != "" && district != "" ){
               Get.to(FindDonorListPage(bloodType: bloodType, division: division, district: district));
             }else{
               return Get.rawSnackbar(
                   messageText: const Text(
                       'PLEASE FILL ALL DROPDOWNS',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 14
                       )
                   ),
                   isDismissible: false,
                   duration: const Duration(seconds: 2),
                   backgroundColor: Colors.red[400]!,
                   icon : const Icon(Icons.error_outline, color: Colors.white, size: 35,),
                   margin: EdgeInsets.zero,
                   snackStyle: SnackStyle.GROUNDED
               );
             }
              // cnt.getFindDonor(bloodType,division,district);

            },
            child: "Find Donor",
          ),
        ],
      ),
    );
  }
}
