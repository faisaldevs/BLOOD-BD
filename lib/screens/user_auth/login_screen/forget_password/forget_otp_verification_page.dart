
import 'package:blood_bd/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../controllers/forget_password_controller.dart';
import '../../../global_widget/custom_button.dart';

class ForgetPassOtpVerification extends StatelessWidget {
  ForgetPassOtpVerification({super.key, this.number});
  final number;


  final ForgetPassController controller =
  Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 60.0,
      width: 60.0,
      textStyle: GoogleFonts.urbanist(
        fontSize: 24.0,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 1.0,
        ),
      ),
    );

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.14,
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
                'OTP VERIFICATION',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),

              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Enter the OTP Send To : ",style: TextStyle(color: Colors.black  )),
                    TextSpan(text: "+88${number}",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1,color: Colors.black)),
                  ]
              )),
              SizedBox(
                height: height * 0.02,
              ),

              /// pinput package we will use here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: width,
                  child: Pinput(
                    // key: controller.otpKey,
                    // senderPhoneNumber: "01903440069",
                    controller: controller.otpController,
                    validator: (otp) {
                      if (otp!.isEmpty) {
                        // print(otp);
                        return "Enter OTP pin";
                      }
                      return null;
                    },
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16.0,
              ),
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       // print("object");
              //       // Get.toNamed(home);
              //
              //       controller.numberValidate(context);
              //     },
              //     child: Text(
              //       'Resend OTP',
              //       style: GoogleFonts.urbanist(
              //         fontSize: 14.0,
              //         color: Colors.black,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //   ),
              // ),

              /// Continue Button
              const Expanded(child: SizedBox()),
              // SizedBox(
              //     width: width,
              //     child: CustomButton(
              //         onPressed: () {
              //           // otpValidation();
              //           // Get.toNamed(home);
              //           // Get.to(ForgetPasswordPage());
              //           controller.otpValidate();
              //         },
              //         child: const Text("Continue",style: TextStyle(color: Colors.white),))),

              SizedBox(
                  width: double.infinity,
                  child: Obx(
                        () => CustomButton(
                      onPressed: () {
                        if (controller.otpController.text == "") {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: "Enter OTP",
                              backgroundColor: Colors.red,
                              time: 1);
                        } else if (controller.otpController.text.length !=
                            6) {
                          CustomSnackBar().showSnackBar(
                              context: context,
                              content: "Enter a valid OTP",
                              backgroundColor: Colors.red,
                              time: 1);
                        } else {
                          FocusScope.of(context).unfocus();
                          controller.otpValidate(context);
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
    );
  }
}
