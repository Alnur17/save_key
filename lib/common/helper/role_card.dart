import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? borderColor;
  final Color? backgroundColor;

  const RoleCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor =
        isSelected ? AppColors.greenNormal : (borderColor ?? AppColors.silver);
    final effectiveBackgroundColor = isSelected
        ? AppColors.greenLight
        : (backgroundColor ?? AppColors.bottomNavbar);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.h,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: effectiveBorderColor,
          ),
          color: effectiveBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, scale: 4),
            sh12,
            Text(
              title,
              style: h3.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
