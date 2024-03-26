import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../controllers/signup_otp_controller.dart';
import '../../global_widget/custom_button.dart';

class SignupOTPVerification extends StatefulWidget {
  const SignupOTPVerification({super.key});

  @override
  State<SignupOTPVerification> createState() => _SignupOTPVerificationState();
}

class _SignupOTPVerificationState extends State<SignupOTPVerification> {

  SignupOTPController signupOTPController = Get.put(SignupOTPController());

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
              const Icon(Icons.check_circle,size: 90,color: Colors.red,),
              SizedBox(height: height*0.04,),
              Text(
                'OTP VERIFICATION',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: height*0.04,),

              const Text("Enter the OTP Send To :+88"),
              SizedBox(
                height: height * 0.02,
              ),

              /// pinput package we will use here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: width,
                  child: Pinput(
                      key: signupOTPController.formKey,
                      // senderPhoneNumber: "01903440069",
                      controller: signupOTPController.signupOtpController,
                      validator: (otp) {
                        if (otp!.isEmpty) {
                          // print(otp);
                          return "Enter OTP pin";

                        }
                        return null;
                      },
                      length: 4,
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
                      )),
                ),
              ),

              const SizedBox(
                height: 16.0,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    // print("object");
                    // Get.toNamed(home);
                  },
                  child: Text(
                    'Resend Button',
                    style: GoogleFonts.urbanist(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              /// Continue Button
              const Expanded(child: SizedBox()),
              SizedBox(width: width,child: CustomButton(onPressed: (){
                // otpValidation();
                // Get.toNamed(home);
              },child : const Text("Continue"))),
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
