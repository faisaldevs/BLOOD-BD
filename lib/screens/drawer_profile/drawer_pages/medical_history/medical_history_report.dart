
import 'dart:io';

import 'package:blood_bd/data_list/data_list.dart';
import 'package:blood_bd/screens/global_widget/custom_birthDate.dart';
import 'package:blood_bd/screens/global_widget/custom_button.dart';
import 'package:blood_bd/screens/global_widget/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../controllers/medical_hisory_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../global_widget/custom_file_upload.dart';
import 'medical_text_field.dart';

class NewReport extends StatefulWidget {
  NewReport({super.key});

  @override
  State<NewReport> createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  final MedicalHistoryController controller=
      Get.put(MedicalHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text(
          "New Report",
        ),
        titleSpacing: 0,
        backgroundColor: AppTheme.primary,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppTheme.textColorRed,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: Get.height,
          width: Get.width,
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Please Provide your Medical Information",style: TextStyle(color: AppTheme.textColorRed),),
                      const SizedBox(
                        height: 10,
                      ),
                      MedicalTextField(
                        controller: controller.hemoglobin,

                        textInputType: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required Hemoglobin Level";
                          }
                          return null;
                        },
                        hintText: "15.5 g/dL",
                        labelText: "Hemoglobin Level*",
                        // labelText: "15.5 g/dL",
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(

                            child: CustomDropdown(
                              dropDownList: DataList.bloodListData,
                              label: "Blood Group",
                              onChanged: (value) {
                                controller.bloodType = value;
                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          CustomBirthdate(controller: controller.dayOfTest, label: "Day of Test"),
                        ],
                      ),
                      const SizedBox(height: 8),
                       Row(
                        children: [
                          Text("Infection Diseases ",style: TextStyle(color: AppTheme.textColorRed),),
                           Expanded(
                              child: Divider(
                            color: AppTheme.textColorRed,
                          )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomDropdown(
                              dropDownList: DataList.medicalHistory,
                              label: "Hepatitis",
                              onChanged: (value) {
                                controller.hepatitis = value;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomDropdown(
                              dropDownList: DataList.medicalHistory,
                              label: "Malaria",
                              onChanged: (value) {
                                controller.malaria = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      MedicalTextField(
                        controller: controller.bloodPressure,
                        hintText: "120/80",
                        labelText:  "Blood pressure*",
                        textInputType: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required Hemoglobin Level";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                       Divider(
                        color: AppTheme.textColorRed,
                      ),
                      const SizedBox(height: 8),

                      MedicalTextField(
                        controller: controller.institutionName,
                        // hintText: "15.5 g/dL",
                        textInputType: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "required Hemoglobin Level";
                          }
                          return null;
                        },
                        labelText: "Institute Name*",
                      ),

                      const SizedBox(height: 8),
                      CustomFileUpload(
                        padding: const EdgeInsets.all(16),
                        border: Border.all(color: Colors.black54, width: 1),
                        onTap1: () async{
                          final imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);


                            // if (imagePicker != null) {
                             controller.image = imagePicker?.path as File?;
                            // } else {
                            //   print('No image selected.');
                            // }
                        },
                        onTap2: () {

                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  // const SizedBox(height: 30),

                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        // height: 70,
        width: Get.width,
        child: CustomButton(
          onPressed: () {

            // controller.test();

            controller.onSaveReport();
            // Get.toNamed(medicalHistory);
          },
          child: const Text(
            "Save Report",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
