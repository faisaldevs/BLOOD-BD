import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:blood_bd/utils/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/signup_controller.dart';
import '../../../data_list/data_list.dart';

import '../../../utils/app_colors.dart';
import '../../global_widget/custom_birthDate.dart';
import '../../global_widget/custom_button.dart';
import '../../global_widget/custom_dropdown.dart';
import '../../global_widget/custom_textFormField.dart';
import '../login_screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController signupController = Get.put(SignupController());

  List<String> divisions = [];
  List<String> districts = [];
  List<String> thanas = []; // New list for thanas
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedThana; // New variable for selected thana

  Future<void> fetchDivisions() async {
    signupController.fetching.value = true;
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
        signupController.fetching.value = false;
      } else {
        signupController.fetching.value = false;
        throw Exception('Failed to load divisions: ${response.statusCode}');
      }
    } catch (e) {
      signupController.fetching.value = false;
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

  @override
  Widget build(BuildContext context) {
    print("test");
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text("Sign Up"),
        foregroundColor: AppTheme.primaryRed,
        titleSpacing: 0,
        // backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.offAllNamed(welcomePage);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: signupController.signupFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

                //-------Name Field --------------

                CustomTextFormField(
                  controller: signupController.nameController,
                  hintText: "",
                  textInputType: TextInputType.text,
                  validate: (name) {
                    if (name!.isEmpty) {
                      return "Full name required";
                    }
                    return null;
                  },
                  labelText: "Full Name",
                ),

                const SizedBox(height: 10),

                //-------Gender Date Field --------------
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        dropDownList: DataList.genderListData,
                        label: 'Gender',
                        onChanged: (value) {
                          signupController.gender = value;
                          print(value);
                        },
                      ),
                    ),

                    //CustomDropdown(
                    //                       // controller: signupController.genderController,
                    //                       dropDownList: DataList.genderListData,
                    //                       label: 'Gender', onChanged: () {},
                    //                     )

                    const SizedBox(
                      width: 10,
                    ),
                    CustomBirthdate(
                      controller: signupController.dateController,
                      label: 'Date of Birth',
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                //-------BloodGroup Weight Field --------------
                Row(
                  children: [
                    Expanded(
                        child: CustomDropdown(
                      dropDownList: DataList.bloodListData,
                      label: 'Blood Type',
                      onChanged: (value) {
                        signupController.bloodType = value.toString();
                      },
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        controller: signupController.weightController,
                        hintText: '',
                        textInputType: TextInputType.number,
                        validate: (weight) {
                          if (weight!.isEmpty) {
                            return "Weight required";
                          }
                          return null;
                        },
                        padding: const EdgeInsets.only(left: 10),
                        labelText: 'Weight(Kg)',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                //  -------Division District Field --------------

                Row(
                  children: [
                    Expanded(
                      child: signupController.fetching.value ?DropdownButtonFormField(

                        decoration: inputDecoration("Select Division"),
                        onChanged: (newValue) {
                        },
                        items: null,
                      ) : DropdownButtonFormField(
                        value: selectedDivision,
                        decoration: inputDecoration("Select Division"),
                        onChanged: (newValue) {
                          signupController.division = newValue;
                          setState(() {
                            selectedDivision = newValue;
                            selectedDistrict = null;
                            selectedThana = null; // Reset selected thana
                            fetchDistricts(
                                divisions.indexOf(selectedDivision!) + 1);
                          });
                        },
                        items: divisions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: DropdownButtonFormField(
                      decoration: inputDecoration("Select District"),
                      value: selectedDistrict,
                      onChanged: (newValue) {
                        signupController.district = newValue;
                        setState(() {
                          selectedDistrict = newValue;
                          selectedThana = null; // Reset selected thana
                          fetchThanas(districts.indexOf(selectedDistrict!) + 1);
                        });
                      },
                      items: districts
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }).toList(),
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                //  -------Upazila/City Union Field --------------
                Row(
                  children: [
                    Expanded(
                        child: DropdownButtonFormField(
                      decoration: inputDecoration("Select Thana"),
                      value: selectedThana,
                      onChanged: (newValue) {
                        signupController.thana = newValue;
                        setState(() {
                          selectedThana = newValue;
                        });
                      },
                      items:
                          thanas.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }).toList(),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomDropdown(
                      dropDownList: DataList.districtListData,
                      label: 'Union',
                      onChanged: (value) {
                        signupController.union = value;
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                //  ------- Address Field --------------

                CustomTextFormField(
                  controller: signupController.addressController,
                  hintText: "",
                  textInputType: TextInputType.text,
                  validate: (address) {
                    if (address!.isEmpty) {
                      return "Address required";
                    }
                    return null;
                  },
                  labelText: "Address",
                ),
                const SizedBox(
                  height: 10,
                ),

                //  ------- Mobile Field --------------
                CustomTextFormField(
                  controller: signupController.numberController,
                  hintText: "",
                  length: 11,
                  textInputType: TextInputType.number,
                  validate: (number) {
                    if (number!.isEmpty) {
                      return "Mobile number is required";
                    } else if (number.length != 11) {
                      return "Incorrect mobile number!!";
                    }
                    return null;
                  },
                  labelText: "Number",
                ),

                const SizedBox(
                  height: 10,
                ),
                //  ------- Password Field --------------

                Obx(
                  () => CustomTextFormField(
                    controller: signupController.passwordController,
                    hintText: '',
                    // padding: EdgeInsets.,
                    obscure: signupController.isVisible.value,
                    textInputType: TextInputType.text,
                    validate: (pass) {
                      if (pass!.isEmpty) {
                        return "Password required";
                      }
                      return null;
                    },
                    labelText: 'Password',
                    onTap: () {
                      signupController.showFunction();
                    },
                    suffixFunction: () {
                      signupController.visibility();
                    },
                    suffixIcon:
                        signupController.show.value ? Icons.visibility : null,
                  ),
                ),
                // CustomTextFormField(
                //   controller: signupController.passwordController,
                //   hintText: "",
                //   textInputType: TextInputType.text,
                //   validate: (pass) {
                //     if (pass!.isEmpty) {
                //       return "Mobile number is required";
                //     } else if (pass.length < 7) {
                //       return "Password must be 8 Character";
                //     }
                //     return null;
                //   },
                //   labelText: "Password",
                // ),

                //  ------- Signup Button --------------

                const SizedBox(height: 60),

                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => CustomButton(
                      onPressed: () {
                        signupController.signUpForm();
                      },
                      child: signupController.isSignup.value
                          ? const Center(
                              child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    backgroundColor: Colors.red,
                                  )))
                          : Text(
                              "Sign up",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                Text(
                  "Already Have a account?",
                  style: TextStyle(
                    color: AppTheme.textColorRed,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                TextButton(
                    onPressed: () {
                      Get.to(const LoginScreen());
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.red[300]),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40.0),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
