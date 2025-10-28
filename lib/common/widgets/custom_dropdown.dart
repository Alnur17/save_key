import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class ReusableDropdown extends StatelessWidget {
  final List<String> options;
  final String? hintText;
  final ValueChanged<String?>? onChanged;
  final String? selectedValue;

  const ReusableDropdown({
    super.key,
    required this.options,
    this.hintText,
    this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      decoration: BoxDecoration(
        color: AppColors.textFieldBag,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(16).r,
          dropdownColor: AppColors.white,
          value: selectedValue!.isEmpty ? null : selectedValue,
          isExpanded: true,
          hint: hintText != null
              ? Text(
            hintText!,
            style: h5.copyWith(color: AppColors.grey),
          )
              : null,
          style: h5,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onChanged: onChanged,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

