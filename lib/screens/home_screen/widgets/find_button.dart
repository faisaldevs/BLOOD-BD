import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDonorBtn extends StatelessWidget {
  const FindDonorBtn({super.key, required this.onPressed, required this.child});

  final Function() onPressed;
  final String child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.red),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.redAccent)),
          )),
      child: Text(
        child,
        style: TextStyle(color: Colors.white,fontSize: 16.sp),
      ),
    );
  }
}
