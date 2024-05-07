
import 'package:flutter/material.dart';

class MedicalReport extends StatelessWidget {
   MedicalReport({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.network(""),
        ),
      ),
    );
  }
}
