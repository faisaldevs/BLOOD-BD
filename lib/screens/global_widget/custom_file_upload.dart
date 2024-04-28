import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CustomFileUpload extends StatelessWidget {
  CustomFileUpload(
      {super.key,
      required this.padding,
      required this.border,
      required this.onTap1,
      required this.onTap2});

  final TextEditingController controller = TextEditingController();
  final EdgeInsets padding;
  final Border border;
  final Function() onTap1;
  final Function() onTap2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        // border: border,
        color: AppTheme.textFieldColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Upload*",
            style: TextStyle(fontSize: 18,color: Colors.red),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onTap1,
                child: const Icon(Icons.attach_file_outlined,color: Colors.red,),
              ),
              SizedBox(
                width: Get.width * .05,
              ),
              GestureDetector(
                onTap: onTap2,
                child: const Icon(Icons.camera_alt_outlined,color: Colors.red,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
