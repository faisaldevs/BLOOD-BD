import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   GetStorage getStorage = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (getStorage.read("id") != null) {
      Future.delayed(const Duration(seconds: 2), () => Get.offAllNamed(home));
    } else {
      Future.delayed(
          const Duration(seconds: 2), () => Get.offAllNamed(welcomePage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
      ),
      body: Center(
          child: Text(
        "BLOOD BD",
        style: GoogleFonts.roboto(
            color: Colors.redAccent, fontSize: 54, fontWeight: FontWeight.bold),
      )),
    );
  }
}
