import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class ContactInfoCard extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onTap;

  const ContactInfoCard({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: AppColors.bottomNavbar,
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Image.asset(icon, scale: 4),
            sw8,
            Text(text, style: h4),
          ],
        ),
      ),
    );
  }
}
