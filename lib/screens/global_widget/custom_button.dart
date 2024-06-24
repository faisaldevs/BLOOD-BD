import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: child,
    );
  }
}

ButtonStyle buttonStyle = ButtonStyle(
  padding:
      WidgetStatePropertyAll(const EdgeInsets.only(top: 15, bottom: 15)),
  backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(color: Colors.red)),
  ),
);
