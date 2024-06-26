import 'dart:convert';
import 'package:blood_bd/screens/global_widget/custom_textFormField.dart';
import 'package:blood_bd/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../controllers/become_donor_controller.dart';
import '../../data_list/data_list.dart';
import '../../utils/app_colors.dart';
import '../global_widget/custom_button.dart';
import '../global_widget/custom_dropdown.dart';

class BecomeDonor extends StatefulWidget {
  const BecomeDonor({super.key});

  @override
  State<BecomeDonor> createState() => _BecomeDonorState();
}

class _BecomeDonorState extends State<BecomeDonor> {
  BecomeDonorController controller = Get.put(BecomeDonorController());

  List<String> divisions = [];
  List<String> districts = [];
  List<String> thanas = []; // New list for thanas
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedThana; // New variable for selected thana

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
    print("Test122");
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        backgroundColor: AppTheme.primary,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppTheme.textColorRed,
        title: const Text("Become Donor"),
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          // key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),

                //-------Name Field --------------

                // CustomTextFormField(
                //   controller: controller.patientNameController,
                //   hintText: "",
                //   textInputType: TextInputType.text,
                //   validate: (name) {
                //     if (name.toString().isEmpty) {
                //       return "Patient's name required";
                //     }
                //     return null;
                //   },
                //   labelText: "Patient's Name",
                // ),

                const SizedBox(height: 30),

                //-------Blood Group and  Blood Amount --------------

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomDropdown(
                        dropDownList: DataList.bloodListData,
                        label: 'Blood Group',
                        onChanged: (value) {
                          controller.bloodType = value.toString();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: CustomDropdown(
                          dropDownList: DataList.bloodAmount,
                          label: 'Amount',
                          onChanged: (value) {
                            controller.bloodAmount = value.toString();
                          },
                        )),
                  ],
                ),

                //-------Date  and  Time --------------

                // const SizedBox(height: 10),
                // Row(
                //   children: [
                //     CustomBirthdate(
                //       controller: controller.dateController,
                //       label: 'Date',
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     CustomTimePicker(
                //       controller: controller.timeController,
                //       label: 'time',
                //     ),
                //   ],
                // ),

                const SizedBox(height: 10),
                //-------  Health issue --------------

                CustomDropdown(
                  dropDownList: DataList.healthIssue,
                  label: "Health Issue",
                  onChanged: (value) {
                    controller.healthIssue = value.toString();
                  },
                ),

                const SizedBox(height: 10),

                const Divider(),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        value: selectedDivision,
                        decoration: inputDecoration("Select Division"),
                        onChanged: (newValue) {
                          controller.division = newValue;
                          // signupController.division = newValue;
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
                              style: const TextStyle(color: Colors.red),
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
                            controller.district = newValue;
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
                                style: const TextStyle(color: Colors.red),
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
                            controller.thana = newValue;
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
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }).toList(),
                        )),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // Expanded(
                    //     flex: 1,
                    //     child: CustomDropdown(
                    //       dropDownList: DataList.districtListData,
                    //       label: 'District',
                    //       onChanged: (value) {
                    //         controller.union = value;
                    //       },
                    //     )),
                  ],
                ),
                const SizedBox(height: 10),

                //  ------- Address Field --------------

                CustomTextFormField(
                  controller: controller.addressController,
                  hintText: "",
                  textInputType: TextInputType.text,
                  validate: (address) {
                    if (address.toString().isEmpty) {
                      return "Address required";
                    }
                    return null;
                  },
                  labelText: "Address",
                ),

                const SizedBox(height: 10),

                const Divider(),
                const SizedBox(height: 10),

                CustomTextFormField(
                  controller: controller.contactParsonNameController,
                  hintText: "",
                  textInputType: TextInputType.text,
                  validate: (address) {
                    if (address.toString().isEmpty) {
                      return "Address required";
                    }
                    return null;
                  },
                  labelText: "Contact Person's Name",
                ),
                const SizedBox(
                  height: 10,
                ),

                //  ------- Mobile Field --------------
                CustomTextFormField(
                  controller: controller.numberController,
                  hintText: "",
                  length: 11,
                  textInputType: TextInputType.number,
                  validate: (number) {
                    if (number.toString().isEmpty) {
                      return "Mobile number is required";
                    } else if (number.toString().length != 11) {
                      return "Incorrect mobile number!!";
                    }
                    return null;
                  },
                  labelText: "Number",
                ),

                //  ------- Signup Button --------------

                const SizedBox(
                  height: 40,
                ),

                SizedBox(
                  width: double.infinity,
                  child: Obx(
                        () => CustomButton(
                      onPressed: () {
                         if (controller.bloodType == null) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Blood Group',
                              backgroundColor: Colors.red);
                        }  else if (controller.bloodAmount == null) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Blood Amount',
                              backgroundColor: Colors.red);
                        } else if (controller.healthIssue == null) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Health Issue',
                              backgroundColor: Colors.red);
                        }
                        // else if (controller.hospitalController.text == "") {
                        //   CustomSnackBar().showSnackBar(
                        //       context: context,
                        //       content: 'Enter Hospital Name',
                        //       backgroundColor: Colors.red);
                        // }
                        else if (controller.division == null) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Division',
                              backgroundColor: Colors.red);
                        } else if (controller.district == null) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter District',
                              backgroundColor: Colors.red);
                        } else if (controller.thana == null) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Thana',
                              backgroundColor: Colors.red);
                        } else if (controller.addressController.text == '') {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Address',
                              backgroundColor: Colors.red);
                        } else if (controller.contactParsonNameController.text == '') {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Contract Person Name',
                              backgroundColor: Colors.red);
                        } else if (controller.numberController.text == '') {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter Contract Person Number',
                              backgroundColor: Colors.red);
                        } else if (controller.numberController.text.length != 11) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: 'Enter A Valid Number',
                              backgroundColor: Colors.red);
                        }
                        // else if (controller.noteController.text == "") {
                        //   CustomSnackBar().showSnackBar(
                        //       context: context,
                        //       content: 'Enter A Note',
                        //       backgroundColor: Colors.red);
                        // }
                        else {
                          FocusScope.of(context).unfocus();
                          controller.searchDonor(context);
                        }
                      },
                      child: controller.isLoading.value
                          ? Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                          : Text(
                        "Submit",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  // CustomButton(
                  //     onPressed: () {
                  //       controller.searchDonor();
                  //       // Get.toNamed(home);
                  //     },
                  //     child: const Text(
                  //       "Submit",
                  //       style: TextStyle(color: Colors.white),
                  //     )),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
