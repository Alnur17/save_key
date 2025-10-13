import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomFilterChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget? tagIcon;

  const CustomFilterChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.tagIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8).r,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6).r,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.greenNormal : AppColors.textFieldBag,
          borderRadius: BorderRadius.circular(20).r,
          //border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tagIcon != null) ...[
              tagIcon!,
              sw5,
            ],
            Text(
              text,
              style: h5.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
