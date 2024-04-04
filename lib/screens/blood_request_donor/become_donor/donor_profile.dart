import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class DonorProfile extends StatelessWidget {
  const DonorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        title: const Text("Donor Profile"),
        foregroundColor: AppTheme.primaryRed,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "You are already a donor",
          style: TextStyle(
              fontSize: 34, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
