import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker(
      {super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },

    );

    if (selectedTime != null) {
      if (kDebugMode) {
        print('Selected time: ${selectedTime.format(context)}');
      }
      // You can do something with the selected time here
      setState(() {
        widget.controller.text = selectedTime.format(context).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(color: Colors.red),
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
          suffixIcon:  Icon(Icons.watch_later_outlined,color: AppTheme.textColorRed),
          contentPadding: const EdgeInsets.only(left: 10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none),
        ),
        onTap: () => selectTime(context),
      ),
    );
  }
}
