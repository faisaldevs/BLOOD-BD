import 'package:blood_bd/screens/global_widget/custom_textFormField.dart';
import 'package:blood_bd/screens/user_auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controllers/forget_password_controller.dart';
import '../../../global_widget/custom_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final ForgetPassController passController = Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: passController.passKey,
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
                  'New Password',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                const Text("Enter new Password"),
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
                    }, labelText: 'New Password', ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    controller: passController.confirmPassword,
                    labelText: "Confirm Password",
                    textInputType: TextInputType.text,
                    validate: (value) {
                      if(value!.isEmpty){
                        return "";
                      }
                      return null;
                    },
                    hintText: "Confirm Password"),

                /// Continue Button
                const Expanded(child: SizedBox()),

                SizedBox(
                    width: width,
                    child: CustomButton(
                        onPressed: () {
                          passController.forgetValidation();
                          // print("object");
                          Get.to(const LoginScreen());
                        },
                        child: const Text("Continue",style: TextStyle(color: Colors.white),))),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
