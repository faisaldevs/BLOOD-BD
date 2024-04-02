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
                      width: width,
                      child: CustomButton(
                          onPressed: () {
                            // passController.forgetValidation();
                            // print("object");
                            controller.passChange();
                          },
                          child: const Text("Continue"))),
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
