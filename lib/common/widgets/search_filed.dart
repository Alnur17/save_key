import 'package:flutter/material.dart';
import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import 'custom_textfield.dart';

class SearchFiled extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchFiled({
    super.key,
    required this.onChanged,
    this.hintText = 'Looking for...',
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      borderColor: AppColors.transparent,
      containerColor: AppColors.bottomNavbar,
      onChange: onChanged,
      hintText: hintText,
      preIcon: Image.asset(
        AppImages.search,
        scale: 4,
      ),
    );
  }
}
