import 'package:blood_bd/utils/app_routes.dart';
import 'package:blood_bd/screens/user_auth/signup_screen/signup_screens.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/login_controller.dart';
import '../../global_widget/custom_button.dart';
import '../../global_widget/custom_textFormField.dart';
import 'forget_password/forgetButton.dart';
import 'forget_password/forget_password_number.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text("Login"),
        titleSpacing: 0,
        foregroundColor: AppTheme.primaryRed,
        // backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () =>  Get.offAllNamed(welcomePage),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Form(
            key: _loginController.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const Icon(
                    Icons.account_circle_rounded,
                    size: 70,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Login",
                    style: TextStyle(color: Colors.redAccent, fontSize: 24),
                  ),
                  const SizedBox(height: 20),

                  //------- NUMBER TextField ------
                  CustomTextFormField(
                    controller: _loginController.numberController,
                    hintText: '',
                    length: 11,
                    textInputType: TextInputType.number,
                    validate: (number) {
                      if (number!.isEmpty) {
                        return "Password required";
                      }
                      return null;
                    },
                    labelText: 'Mobile Number',
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //------- Password TextField ------
                  Obx(
                    () => CustomTextFormField(
                      controller: _loginController.passwordController,
                      hintText: '',
                      // padding: EdgeInsets.,
                      obscure: _loginController.isVisible.value,
                      textInputType: TextInputType.text,
                      validate: (pass) {
                        if (pass!.isEmpty) {
                          return "Password required";
                        }
                        return null;
                      },
                      labelText: 'Password',
                      onTap: () {
                        _loginController.showFunction();
                      },
                      suffixFunction: () {
                        _loginController.visibility();
                      },
                      suffixIcon: _loginController.show.value
                          ? _loginController.isVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility
                          : null,
                    ),
                  ),

                  ForgetPasswordWidget(
                    onPressed: () {
                      _loginController.forgetButton;
                      Get.to(ForgetPassNumber());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //------- CONTINUE BUTTON ------

                  SizedBox(
                      width: double.infinity,
                      child: Obx(
                        () => CustomButton(
                          onPressed: () {
                            _loginController.loginForm();
                          },
                          child: _loginController.isLogin.value
                              ? const Center(
                                  child: SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        backgroundColor: Colors.red,
                                      )))
                              : Text(
                                  "Login",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),

                  Text(
                    "Don't Have an account?",
                    style: TextStyle(
                      color: AppTheme.textColorRed,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextButton(
                      onPressed: () {
                        Get.to(SignupScreen());
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
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
