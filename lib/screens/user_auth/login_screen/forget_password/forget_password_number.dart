import 'package:blood_bd/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/forget_password_controller.dart';
import '../../../global_widget/custom_button.dart';
import '../../../global_widget/custom_textFormField.dart';

class ForgetPassNumber extends StatelessWidget {
  ForgetPassNumber({super.key});

  final ForgetPassController controller = Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            // key: controller.key,
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
                  'Enter Phone Number',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                const Text("Enter a Registered Phone Number"),
                SizedBox(
                  height: height * 0.02,
                ),

                /// Password Field

                CustomTextFormField(
                  length: 11,
                  controller: controller.numberController,
                  hintText: "New Password",
                  textInputType: TextInputType.number,
                  validate: (value) {
                    // if(value == 11.toString() && value != null){
                    //   return null;
                    // }else{
                    //   return "Enter a valid Number";
                    // }
                    return null;
                  },
                  labelText: 'Enter Number',
                ),
                const SizedBox(
                  height: 10,
                ),

                /// Continue Button
                const Expanded(child: SizedBox()),

                // SizedBox(
                //   width: width,
                //   child: CustomButton(
                //     onPressed: () {
                //       // passController.forgetValidation();
                //       // print("object");
                //       // Get.to(ForgetPassOtpVerification());
                //       if (controller.numberController.text == "") {
                //         CustomSnackBar().showSnackBar(
                //             context: context,
                //             content: "Enter a Registered Number",
                //             backgroundColor: Colors.red,
                //             time: 1);
                //       } else if (controller.numberController.text.length !=
                //           11) {
                //         CustomSnackBar().showSnackBar(
                //             context: context,
                //             content: "Enter a valid Number",
                //             backgroundColor: Colors.red,
                //             time: 1);
                //       } else {
                //         FocusScope.of(context).unfocus();
                //         controller.numberValidate(context);
                //       }
                //     },
                //     child: const Text(
                //       "Continue",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => CustomButton(
                        onPressed: () {
                          if (controller.numberController.text == "") {
                            CustomSnackBar().showSnackBar(
                                context: context,
                                content: "Enter a Registered Number",
                                backgroundColor: Colors.red,
                                time: 1);
                          } else if (controller.numberController.text.length !=
                              11) {
                            CustomSnackBar().showSnackBar(
                                context: context,
                                content: "Enter a valid Number",
                                backgroundColor: Colors.red,
                                time: 1);
                          } else {
                            FocusScope.of(context).unfocus();
                            controller.numberValidate(context);
                          }
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
    );
  }
}
