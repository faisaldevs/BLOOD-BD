import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class MedicalTextField extends StatelessWidget {
  const MedicalTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.helperText,
    this.obscure = false,
    required this.textInputType,
    this.suffixIcon,
    this.borderColor,
    this.designNumber,
    this.isEnabled,
    this.onChanged,
    this.padding,
    required this.validate,
    required this.labelText,
    this.suffixFunction,
    this.onTap, this.length, this.maxLine,
  });

  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? hintText;
  final int? maxLine;
  final String labelText;
  final String? helperText;
  final bool obscure;
  final TextInputType textInputType;
  final IconData? suffixIcon;
  final Color? borderColor;
  final int? designNumber;
  final int? length;
  final bool? isEnabled;
  final Function(String)? onChanged;
  final String? Function(String?) validate;
  final void Function()? suffixFunction;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: length,
      onTap: onTap,
      // maxLines: maxLine,
      validator: validate,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscure,
      enabled: isEnabled,
      keyboardType: textInputType,
      style: TextStyle(
        color: AppTheme.textColorRed,
      ),
      decoration: InputDecoration(
        fillColor: AppTheme.textFieldColor,
        filled: true,
        suffixIcon: IconButton(
            onPressed : suffixFunction,
            icon: Icon(
              suffixIcon,
              size: 28,
            )),
        contentPadding: padding,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide.none,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none),
        hintText: hintText,
        labelText: labelText,

        labelStyle: TextStyle(
          color: AppTheme.textColorRed,
        ),
        hintStyle: TextStyle(
          color: AppTheme.textColorRed,
        ),
      ),
    );
  }
}
