import 'package:blood_bd/controllers/update_profile_controller.dart';
import 'package:blood_bd/data_list/data_list.dart';
import 'package:blood_bd/screens/global_widget/custom_birthDate.dart';
import 'package:blood_bd/screens/global_widget/custom_dropdown.dart';
import 'package:blood_bd/screens/global_widget/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global_widget/custom_button.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final UpdateProfileController controller = Get.put(UpdateProfileController());

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
          "Edit Profile",
          style: TextStyle(color: Colors.red),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
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
          // key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  // color: Colors.red,
                  height: Get.height * .15,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        // color: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.image_outlined,
                            size: 40,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                //-------Name Field --------------

                CustomTextFormField(
                  controller: controller.nameController,
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
                          controller.gender = value.toString();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomBirthdate(
                      controller: controller.dateController,
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
                        controller.bloodType = value.toString();
                      },
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.weightController,
                        hintText: '',
                        textInputType: TextInputType.number,
                        validate: (weight) {
                          if (weight!.isEmpty) {
                            return "Full name required";
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
                        child: CustomDropdown(
                      dropDownList: DataList.divisionListData,
                      label: 'Division',
                      onChanged: (value) {
                        controller.division = value;
                      },
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomDropdown(
                      dropDownList: DataList.districtListData,
                      label: 'District',
                      onChanged: (value) {
                        controller.district = value;
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                //  -------Upazila/City Union Field --------------
                Row(
                  children: [
                    Expanded(
                        child: CustomDropdown(
                      dropDownList: DataList.districtListData,
                      label: 'Upazila',
                      onChanged: (value) {
                        controller.upazila = value;
                      },
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomDropdown(
                      dropDownList: DataList.districtListData,
                      label: 'Union',
                      onChanged: (value) {
                        controller.union = value;
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                //  ------- Address Field --------------

                CustomTextFormField(
                  controller: controller.addressController,
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

                const SizedBox(
                  height: 10,
                ),
                //  ------- Signup Button --------------

                const SizedBox(height: 60),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    onPressed: () {
                      // print("pressed");
                      controller.updateProfile();
                    },
                    child: Text(
                      'Save Change',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text("Change Mobile Number?"),

                Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Change Number??",
                          style: TextStyle(color: Colors.red),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
