import 'dart:convert';
import 'package:blood_bd/controllers/update_profile_controller.dart';
import 'package:http/http.dart' as http;
import 'package:blood_bd/data_list/data_list.dart';
import 'package:blood_bd/screens/global_widget/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';
import '../global_widget/custom_button.dart';
import 'components/textfield_custom.dart';

class EditProfile extends StatefulWidget {
  EditProfile(
      {super.key, required this.name, required this.date, required this.bloodGroup, required this.gender, required this.division, required this.district, required this.thana, required this.address, required this.weight});

  final String name;
  final String date;
  final String bloodGroup;
  final String gender;
  final String division;
  final String district;
  final String thana;
  final String address;
  final String weight;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final UpdateProfileController controller = Get.put(UpdateProfileController());

  List<String> divisions = [];
  List<String> districts = [];
  List<String> thanas = [];
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedThana;

  // get http => null;

  Future<void> fetchDivisions() async {
    // signupController.fetching.value = true;
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
        // signupController.fetching.value = false;
        throw Exception('Failed to load divisions: ${response.statusCode}');
      }
    } catch (e) {
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

  inputDecoration(String label, String hintText) {
    return InputDecoration(
      hintText: label + " : " + hintText,
      // labelText: label,
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
        color: Colors.red,
      ),
      hintStyle: TextStyle(
        color: AppTheme.textColorRed,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text(
          "Update Profile",
          style: TextStyle(color: Colors.red),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: controller.profileUpdateKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8),
                  // color: Colors.red,
                  // height: Get.height * .15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        // margin: EdgeInsets.only(bottom: 10),
                        // color: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     IconButton(onPressed: (){}, icon: Icon(
                      //       Icons.camera_alt_outlined,
                      //       size: 40,
                      //     ),),
                      //     SizedBox(
                      //       width: 15,
                      //     ),
                      //     IconButton(onPressed: (){}, icon: Icon(
                      //       Icons.image_outlined,
                      //       size: 40,
                      //     ),),
                      //   ],
                      // )
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                //-------Name Field --------------

                ProfileTextField(
                  controller: controller.nameController,
                  hintText: "Full Name : ${widget.name}",
                  textInputType: TextInputType.text,
                  validate: (name) {
                    if (name!.isEmpty) {
                      return "Full name required";
                    }
                    return null;
                  },
                  // labelText: "Full Name",
                ),

                const SizedBox(height: 15),

                //-------Gender Date Field --------------
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        dropDownList: DataList.genderListData,
                        label: "Gender : ${widget.gender}",
                        onChanged: (value) {
                          controller.gender = value.toString();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomDropdown(
                          dropDownList: DataList.bloodListData,
                          label: 'Blood Type : ${widget.bloodGroup}',
                          onChanged: (value) {
                            if (value != null) {
                              controller.bloodType = value.toString();
                            } else {
                              controller.bloodType = widget.bloodGroup;
                            }
                          },
                        )),

                    // CustomBirthdate(
                    //   controller: controller.dateController,
                    //   label: 'Date of Birth',
                    // ),
                  ],
                ),
                const SizedBox(height: 15),

                //-------BloodGroup Weight Field --------------
                Row(
                  children: [

                    Expanded(
                      child: ProfileTextField(
                        controller: controller.weightController,
                        hintText: "Weight(Kg) : ${widget.weight}",
                        textInputType: TextInputType.number,
                        validate: (weight) {
                          if (weight!.isEmpty) {
                            return "Weight required";
                          }
                          return null;
                        },
                        padding: const EdgeInsets.only(left: 10),
                        // labelText: '',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: DropdownButtonFormField(
                          value: selectedDivision,
                          decoration: inputDecoration(
                              "Division", widget.division),
                          onChanged: (newValue) {
                            controller.division = newValue;
                            setState(() {
                              selectedDivision = newValue;
                              selectedDistrict = null;
                              selectedThana = null;
                              districts.clear();
                              thanas.clear();
                              fetchDistricts(
                                  divisions.indexOf(selectedDivision!) + 1);
                            });
                          },
                          items: divisions.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              }).toList(),
                        )),
                  ],
                ),
                const SizedBox(height: 15),

                //  -------Division District Field --------------
                // Row(
                //   children: [
                //     Expanded(
                //         child: CustomDropdown(
                //           dropDownList: DataList.districtListData,
                //           label: widget.district,
                //           onChanged: (value) {
                //             controller.district = value;
                //           },
                //         )),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Expanded(
                //         child: CustomDropdown(
                //           dropDownList: DataList.districtListData,
                //           label: widget.thana,
                //           onChanged: (value) {
                //             controller.upazila = value;
                //           },
                //         )),
                //   ],
                // ),
                Row(
                  children: [
                    Expanded(
                        child: DropdownButtonFormField(
                          decoration: inputDecoration(
                              "District", widget.district),
                          value: selectedDistrict,
                          onChanged: (newValue) {
                            controller.district = newValue;
                            setState(() {
                              selectedDistrict = newValue;
                              selectedThana = null;
                              thanas.clear();
                              fetchThanas(
                                  districts.indexOf(selectedDistrict!) + 1);
                            });
                          },
                          items: districts
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }).toList(),
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: DropdownButtonFormField(
                          decoration: inputDecoration("Thana", widget.thana),
                          value: selectedThana,
                          onChanged: (newValue) {
                            controller.upazila = newValue;
                            setState(() {
                              selectedThana = newValue;
                            });
                          },
                          items: thanas.map<DropdownMenuItem<String>>((
                              String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }).toList(),
                        )),
                  ],
                ),
                const SizedBox(height: 15),
                //  -------Upazila/City Union Field --------------

                //  ------- Address Field --------------

                ProfileTextField(
                  controller: controller.addressController,
                  hintText: "Address : ${widget.address}",
                  textInputType: TextInputType.text,
                  validate: (address) {
                    if (address!.isEmpty) {
                      return "Address required";
                    }
                    return null;
                  },
                  // labelText: "",
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 10,
                ),
                //  ------- Signup Button --------------

                const SizedBox(height: 60),

                // const Text("Change Mobile Number?"),
                //
                // Container(
                //     margin: const EdgeInsets.only(top: 8),
                //     decoration: const BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(20)),
                //     ),
                //     child: TextButton(
                //         onPressed: () {},
                //         child: const Text(
                //           "Change Number??",
                //           style: TextStyle(color: Colors.red),
                //         )))
              ],
            ),
          ),
        ),
      ),

        // const Center(
        //     child: SizedBox(
        //         height: 18,
        //         width: 18,
        //         child: CircularProgressIndicator(
        //           color: Colors.white,
        //           backgroundColor: Colors.red,
        //         )))
      floatingActionButton:  Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: double.infinity,
          child: Obx(
                () => CustomButton(
                  onPressed: () {
                    // print("pressed");
                    controller.updateProfile(
                      widget.name,
                      widget.date,
                      widget.weight,
                      widget.address,
                      widget.bloodGroup,
                      widget.gender,
                      widget.division,
                      widget.district,
                      widget.thana,);
                  },
              child: controller.Loading.value == true
                  ? SizedBox(  height: 18,
                  width: 18,child: CircularProgressIndicator(color: Colors.white,))
                  : Text(
                  'Save Change',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
