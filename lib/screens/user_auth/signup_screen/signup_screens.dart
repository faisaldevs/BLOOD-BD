import 'package:blood_bd/controllers/welcome_controller.dart';
import 'package:blood_bd/global/app_routes.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/signup_controller.dart';
import '../../../data_list/data_list.dart';

import '../../../utils/app_colors.dart';
import '../../global_widget/custom_birthDate.dart';
import '../../global_widget/custom_button.dart';
import '../../global_widget/custom_dropdown.dart';
import '../../global_widget/custom_textFormField.dart';
import '../login_screen/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    print("test");
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text("Sign Up"),
        foregroundColor: AppTheme.primaryRed,
        titleSpacing: 0,
        // backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            signupController.getBack();
          } ,
          child: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: signupController.signupFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

                //-------Name Field --------------

                CustomTextFormField(
                  controller: signupController.nameController,
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
                          signupController.gender = value;
                          print(value);
                        },
                      ),
                    ),

                    //CustomDropdown(
                    //                       // controller: signupController.genderController,
                    //                       dropDownList: DataList.genderListData,
                    //                       label: 'Gender', onChanged: () {},
                    //                     )

                    const SizedBox(
                      width: 10,
                    ),
                    CustomBirthdate(
                      controller: signupController.dateController,
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
                        signupController.bloodType = value.toString();
                      },
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        controller: signupController.weightController,
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
                    // Expanded(
                    //     child: CustomDropdown(
                    //       dropDownList: DataList.districtListData,
                    //       label: 'District',
                    //       onChanged: (value) {
                    //         signupController.division = value;
                    //       },
                    //     )),
                    Expanded(
                      child:   FutureBuilder(
                        future: signupController.getDivision(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (snapshot.hasData) {
                            return ApiDropdown(
                                dropDownList: snapshot.data!.map((e) {
                                  return DropdownMenuItem(
                                    value: e.division,
                                    child: Text(e.division.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.red)),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (kDebugMode) {
                                    print(value.toString());
                                  }
                                }, label: 'Division',);
                          } else {
                            return const Text("no data found");
                          }


                        },
                      ),
                      // FutureBuilder(
                      //   future: signupController.getDivision(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return ApiDropdown(
                      //         dropDownList: snapshot.data!.map((e) {
                      //           return DropdownMenuItem(
                      //             value: e.id,
                      //             child: Text(e.division.toString(),
                      //                 style: TextStyle(
                      //                     fontWeight: FontWeight.normal,
                      //                     color: AppTheme.textColorRed)),
                      //           );
                      //         }).toList(),
                      //         label: 'Division',
                      //         onChanged: (value) {
                      //           // signupController.division = value;
                      //           print(value.toString());
                      //         },
                      //       );
                      //     } else {
                      //       return const Center(
                      //           child: CircularProgressIndicator());
                      //     }
                      //   },
                      // ),
                    ),



                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomDropdown(
                      dropDownList: DataList.districtListData,
                      label: 'District',
                      onChanged: (value) {
                        signupController.district = value;
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
                        signupController.upazila = value;
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
                        signupController.union = value;
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                //  ------- Address Field --------------

                CustomTextFormField(
                  controller: signupController.addressController,
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

                //  ------- Mobile Field --------------
                CustomTextFormField(
                  controller: signupController.numberController,
                  hintText: "",
                  length: 11,
                  textInputType: TextInputType.number,
                  validate: (number) {
                    if (number!.isEmpty) {
                      return "Mobile number is required";
                    } else if (number.length != 11) {
                      return "Incorrect mobile number!!";
                    }
                    return null;
                  },
                  labelText: "Number",
                ),

                const SizedBox(
                  height: 10,
                ),
                //  ------- Password Field --------------

                Obx(
                  () => CustomTextFormField(
                    controller: signupController.passwordController,
                    hintText: '',
                    // padding: EdgeInsets.,
                    obscure: signupController.isVisible.value,
                    textInputType: TextInputType.text,
                    validate: (pass) {
                      if (pass!.isEmpty) {
                        return "Password required";
                      }
                      return null;
                    },
                    labelText: 'Password',
                    onTap: () {
                      signupController.showFunction();
                    },
                    suffixFunction: () {
                      signupController.visibility();
                    },
                    suffixIcon:
                        signupController.show.value ? Icons.visibility : null,
                  ),
                ),
                // CustomTextFormField(
                //   controller: signupController.passwordController,
                //   hintText: "",
                //   textInputType: TextInputType.text,
                //   validate: (pass) {
                //     if (pass!.isEmpty) {
                //       return "Mobile number is required";
                //     } else if (pass.length < 7) {
                //       return "Password must be 8 Character";
                //     }
                //     return null;
                //   },
                //   labelText: "Password",
                // ),

                //  ------- Signup Button --------------

                const SizedBox(height: 60),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => CustomButton(
                      onPressed: () {
                        signupController.signUpForm();
                      },
                      child: signupController.isSignup.value
                          ? const Center(
                              child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    backgroundColor: Colors.red,
                                  )))
                          : Text(
                              "Sign up",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                Text(
                  "Already Have a account?",
                  style: TextStyle(
                    color: AppTheme.textColorRed,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                TextButton(
                    onPressed: () {
                      Get.to(const LoginScreen());
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
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//-------------code---------------------------
//FutureBuilder(future: signupController.getPost(), builder: (context, snapshot) {
//       if(snapshot.hasData){
//         return Scaffold(
//           appBar: AppBar(
//             systemOverlayStyle: const SystemUiOverlayStyle(
//               statusBarColor: Colors.redAccent,
//               // Status bar brightness (optional)
//               statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//               statusBarBrightness: Brightness.light, // For iOS (dark icons)
//             ),
//             title: const Text(
//               "Sign Up",
//               style: TextStyle(color: Colors.red),
//             ),
//             titleSpacing: 0,
//             backgroundColor: Colors.white,
//             elevation: 0,
//             leading: InkWell(
//               onTap: () => Get.back(),
//               child: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//           body: Container(
//             margin: const EdgeInsets.all(16),
//             child: Form(
//               key: signupController.signupFormKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//
//                     //-------Name Field --------------
//
//                     CustomTextFormField(
//                       controller: signupController.nameController,
//                       hintText: "",
//                       textInputType: TextInputType.text,
//                       validate: (name) {
//                         if (name!.isEmpty) {
//                           return "Full name required";
//                         }
//                         return null;
//                       },
//                       labelText: "Full Name",
//                     ),
//
//                     const SizedBox(height: 10),
//
//                     //-------Gender Date Field --------------
//                     Row(
//                       children: [
//                         Expanded(
//                             child: CustomDropdown(
//                               // controller: signupController.genderController,
//                               dropDownList: DataList.genderListData,
//                               label: '', onChanged: () {  },
//                             )),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         CustomBirthdate(
//                           controller: signupController.dateController,
//                           label: 'Date of Birth',
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//
//                     //-------BloodGroup Weight Field --------------
//                     Row(
//                       children: [
//                         Expanded(
//                             child: CustomDropdown(
//                               // controller: signupController.bloodGroupController,
//                               dropDownList: DataList.bloodListData,
//                               label: '', onChanged: () {  },
//                             )),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: CustomTextFormField(
//                             controller: signupController.weightController,
//                             hintText: '',
//                             textInputType: TextInputType.number,
//                             validate: (weight) {
//                               if (weight!.isEmpty) {
//                                 return "Full name required";
//                               }
//                               return null;
//                             },
//                             padding: const EdgeInsets.only(left: 10),
//                             labelText: 'Weight(Kg)',
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//
//                     //  -------Division District Field --------------
//                     Row(
//                       children: [
//                         Expanded(
//                             child: CustomDropdown(
//                               // controller: signupController.divisionController,
//                               dropDownList: DataList.divisionListData,
//                               label: 'Division', onChanged: () {  },
//                             )),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                             child: CustomDropdown(
//                               // controller: signupController.districtController,
//                               dropDownList: DataList.districtListData,
//                               label: 'District', onChanged: () {  },
//                             )),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     //  -------Upazila/City Union Field --------------
//                     Row(
//                       children: [
//                         Expanded(
//                             child: CustomDropdown(
//                               // controller: signupController.upazilaController,
//                               dropDownList: DataList.divisionListData,
//                               label: 'Upazila', onChanged: () {  },
//                             )),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                             child: CustomDropdown(
//                               dropDownList: DataList.districtListData,
//                               label: 'District', onChanged: () {  },
//                             )),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     //  ------- Address Field --------------
//
//                     CustomTextFormField(
//                       controller: signupController.addressController,
//                       hintText: "",
//                       textInputType: TextInputType.text,
//                       validate: (address) {
//                         if (address!.isEmpty) {
//                           return "Address required";
//                         }
//                         return null;
//                       },
//                       labelText: "Address",
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//
//
//
//                     //  ------- Mobile Field --------------
//                     CustomTextFormField(
//                       controller: signupController.numberController,
//                       hintText: "",
//                       textInputType: TextInputType.number,
//                       validate: (number) {
//                         if (number!.isEmpty) {
//                           return "Mobile number is required";
//                         } else if (number.length != 11) {
//                           return "Incorrect mobile number!!";
//                         }
//                         return null;
//                       },
//                       labelText: "Number",
//                     ),
//
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     //  ------- Password Field --------------
//                     CustomTextFormField(
//                       controller: signupController.numberController,
//                       hintText: "",
//                       textInputType: TextInputType.text,
//                       validate: (pass) {
//                         if (pass!.isEmpty ){
//                           return "Mobile number is required";
//                         } else if(pass.length < 7){
//                           return "Password must be 8 Character";
//                         }
//                         return null;
//                       },
//                       labelText: "Password",
//                     ),
//
//                     //  ------- Signup Button --------------
//
//                     const SizedBox(height: 60),
//
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       // child: CustomButton(onPressed: () {
//                       //   controller.signUpForm();
//                       // }, buttonText: "Sign Up"),
//                       child: CustomButton(
//                         onPressed: () {
//                           // print("pressed");
//                           signupController.signUpForm();
//                         },
//                         child:Text(
//                           'Sign Up',
//                           style: GoogleFonts.roboto(
//                             color: AppColor.wColor, fontSize: 18,),
//                         ),
//                       ),
//
//                     ),
//                     const SizedBox(height: 40,),
//
//                     const Text("Already Have a account?"),
//                     const SizedBox(height: 20,),
//
//                     TextButton(onPressed: (){
//                       Get.to(const LoginScreen());
//                     },
//                         style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red[300]),
//                           padding: MaterialStateProperty.all(
//                             const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
//                           ),
//                         ),
//                         child: const Text("Login",style: TextStyle(color: Colors.white,fontSize: 18),)),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }else{
//         return const Scaffold(body: Center(child: CircularProgressIndicator(color: Colors.red,)),);
//       }
//     },);
