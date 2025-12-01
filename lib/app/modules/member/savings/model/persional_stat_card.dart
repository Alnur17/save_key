import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class PersonalStatCard extends StatelessWidget {
  final String title;
  final String amount;
  final String? label;
  final String iconPath;
  final double height;

  const PersonalStatCard({
    super.key,
    required this.title,
    required this.amount,
    this.label,
    required this.iconPath,
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        color: AppColors.splashBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greenNormal),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: h3)),
              sw8,
              Image.asset(iconPath, scale: 4),
            ],
          ),
          sh12,
          Text(amount, style: h2),
          if (label != null) sh12,
          if (label != null) Text(label!, style: h5),
        ],
      ),
    );
  }
}
