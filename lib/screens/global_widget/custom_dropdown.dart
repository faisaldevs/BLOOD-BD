import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomDropdown extends StatefulWidget {
  CustomDropdown({
    super.key,
    required this.dropDownList,
    required this.label,
    required this.onChanged, this.validation,
    // required this.hint,
  });

  final String label;
  final Function()? validation;
  final List dropDownList;
  var onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // validator: validation,
      icon: Icon(
        Icons.arrow_drop_down,
        color: AppTheme.textColorRed,
      ),
      decoration: InputDecoration(
        hintText: widget.label,
        fillColor: AppTheme.textFieldColor,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 12),
        counterStyle: const TextStyle(fontWeight: FontWeight.bold),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide.none,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none),
        labelStyle: TextStyle(
          color: AppTheme.textColorRed,
        ),
        hintStyle: TextStyle(
          color: AppTheme.textColorRed,
        ),
      ),
      items: widget.dropDownList.map((e) {
        return DropdownMenuItem(
            value: e,
            child: Text(e,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppTheme.textColorRed)));
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}




class ApiDropdown extends StatelessWidget {
  ApiDropdown({super.key, required this.label, required this.dropDownList,    required this.onChanged,});
  final String label;

  final List<DropdownMenuItem<dynamic>> dropDownList;
  var onChanged;

  @override
  Widget build(BuildContext context) {
    print('d list: $dropDownList');
    return DropdownButtonFormField(
      icon: Icon(
        Icons.arrow_drop_down,
        color: AppTheme.textColorRed,
      ),
      decoration: InputDecoration(
        hintText: label,
        fillColor: AppTheme.textFieldColor,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 12),
        counterStyle: const TextStyle(fontWeight: FontWeight.bold),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide.none,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none),
        labelStyle: TextStyle(
          color: AppTheme.textColorRed,
        ),
        hintStyle: TextStyle(
          color: AppTheme.textColorRed,
        ),
      ),
      items: dropDownList,
      onChanged: onChanged,
    );
  }
}
