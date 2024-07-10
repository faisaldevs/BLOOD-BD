import 'package:blood_bd/screens/global_widget/custom_textFormField.dart';
import 'package:blood_bd/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controllers/forget_password_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../global_widget/custom_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final ForgetPassController passController = Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text("Forgot Password"),
        titleSpacing: 0,
        foregroundColor: AppTheme.primaryRed,
        // backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            // key: passController.passKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
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
                Center(
                  child: Text(
                    'New Password',
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                Center(child: const Text("Enter new Password")),
                SizedBox(
                  height: height * 0.02,
                ),

                /// Password Field

                CustomTextFormField(
                  controller: passController.newPassword,
                  hintText: "New Password",
                  textInputType: TextInputType.text,
                  validate: (value) {
                    return null;
                  },
                  labelText: 'New Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    controller: passController.confirmPassword,
                    labelText: "Confirm Password",
                    textInputType: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    hintText: "Confirm Password"),

                /// Continue Button
                const SizedBox(
                  height: 25.0,
                ),
                Obx(
                      () => CustomButton(
                    onPressed: () {
                      if (passController.newPassword.text == '') {
                        CustomSnackBar().showSnackBar(
                            context: context,
                            content: 'Enter New Password',
                            backgroundColor: Colors.red);
                      } else if (passController.newPassword.text.length < 6) {
                        CustomSnackBar().showSnackBar(
                            context: context,
                            content: 'Password must be more than 6 characters',
                            backgroundColor: Colors.red);
                      } else if (passController.confirmPassword.text == '') {
                        CustomSnackBar().showSnackBar(
                            context: context,
                            content: 'Enter confirm password',
                            backgroundColor: Colors.red);
                      } else if (passController.confirmPassword.text !=
                          passController.newPassword.text) {
                        CustomSnackBar().showSnackBar(
                            context: context,
                            content: "Password dosen't match",
                            backgroundColor: Colors.red);
                      } else if (passController.confirmPassword.text.length < 6) {
                        CustomSnackBar().showSnackBar(
                            context: context,
                            content: 'Password must be more than 6 characters',
                            backgroundColor: Colors.red);
                      } else {
                        FocusScope.of(context).unfocus();
                        passController.forgetValidation(context);
                      }
                    },
                    child: passController.isLoading.value
                        ? const Center(
                        child: SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              backgroundColor: Colors.red,
                            )))
                        : Text(
                      "Change Password",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

      // floatingActionButton: ,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
