import 'package:blood_bd/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/change_pass_controller.dart';
import '../../../utils/app_colors.dart';
import '../../global_widget/custom_button.dart';
import '../../global_widget/custom_textFormField.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final controller = Get.put(ChangePassController());

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppTheme.textColorRed,
        title: const Text("Change Password"),
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: controller.changePassKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.14,
                  ),
                  const Icon(
                    Icons.check_circle,
                    size: 90,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    'Change Password',
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
              
                  // const Text("Enter new Password"),
                  SizedBox(
                    height: height * 0.02,
                  ),
              
                  /// Password Field
              
                  CustomTextFormField(
                    controller: controller.currentPassword,
                    hintText: "Old Password",
                    textInputType: TextInputType.text,
                    validate: (value) {
                      return null;
                    },
                    labelText: 'Old Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      controller: controller.newPassword,
                      labelText: "New Password",
                      textInputType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "faisal";
                        }
                        return null;
                      },
                      hintText: "New Password",
                  ),
              
                  const SizedBox(
                    height: 10,
                  ),
              
                  CustomTextFormField(
                    controller: controller.confirmNewPassword,
                    labelText: "Confirm Password",
                    textInputType: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "faisal";
                      }
                      return null;
                    },
                    hintText: "Confirm Password",
                  ),
              
                  // Continue Button
                  const SizedBox(height: 40,),
                  SizedBox(
                      width: double.infinity,
                      child: Obx(
                            () => CustomButton(
                              onPressed: () {
                                if (controller.currentPassword.text == "") {
                                  CustomSnackBar().showSnackBar(
                                      context: context,
                                      content: "Enter Old Password",
                                      backgroundColor: Colors.red,
                                      time: 1);
                                } else if (controller.newPassword.text == "") {
                                  CustomSnackBar().showSnackBar(
                                      context: context,
                                      content: "Enter New Password",
                                      backgroundColor: Colors.red,
                                      time: 1);
                                }else if (controller.confirmNewPassword.text == "") {
                                  CustomSnackBar().showSnackBar(
                                      context: context,
                                      content: "Enter Confirm Password",
                                      backgroundColor: Colors.red,
                                      time: 1);
                                }else if (controller.newPassword.text != controller.confirmNewPassword.text) {
                                  CustomSnackBar().showSnackBar(
                                      context: context,
                                      content: "Passsword Doesn't match",
                                      backgroundColor: Colors.red,
                                      time: 1);
                                }else{
                                  FocusScope.of(context).unfocus();
                                  controller.passChange(context);}
                              },
                          child: controller.isLoading.value
                              ? const Center(
                              child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    backgroundColor: Colors.red,
                                  )))
                              : Text(
                            "Continue",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
