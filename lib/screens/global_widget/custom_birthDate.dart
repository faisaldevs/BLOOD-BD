import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';

class CustomBirthdate extends StatefulWidget {
  const CustomBirthdate(
      {super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  State<CustomBirthdate> createState() => _CustomBirthdateState();
}

class _CustomBirthdateState extends State<CustomBirthdate> {
  @override
  Widget build(BuildContext context) {
    void showBirthDate() async {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(1800),
          initialDate: DateTime.now(),
          lastDate: DateTime(2025));

      setState(() {
        widget.controller.text = DateFormat("y-M-d").format(pickedDate!);
      });
    }

    return Expanded(
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(color: Colors.red),
        validator: (age) {
          if (age!.isEmpty) {
            return "Date of birth required";
          }
          return null;
        },
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: AppTheme.textFieldColor,
          filled: true,
          hintText: widget.label,
          hintStyle: const TextStyle(color: Colors.red),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.calendar_month_outlined,color: Colors.red,),
          contentPadding: const EdgeInsets.only(left: 10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none),
        ),
        onTap: () => showBirthDate(),
      ),
    );
  }
}
