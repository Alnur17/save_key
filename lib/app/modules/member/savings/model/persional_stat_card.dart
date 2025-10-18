import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class PersonalStatCard extends StatelessWidget {
  final String title;
  final String amount;
  final String? percentage; // made optional
  final String label;
  final String iconPath;
  final bool isPositive;

  const PersonalStatCard({
    super.key,
    required this.title,
    required this.amount,
    required this.label,
    required this.iconPath,
    this.percentage,
    this.isPositive = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isPositive ? AppColors.greenNormal : Colors.red;

    return Container(
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: h3),
              sw8,
              Image.asset(iconPath, scale: 4),
            ],
          ),
          sh12,
          Text(amount, style: h2),
          sh12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (percentage != null) ...[
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color.withOpacity(0.2),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.arrowUpDown,
                        scale: 4,
                      ),
                      sw5,
                      Text(
                        percentage!,
                        style: h5.copyWith(color: color),
                      ),
                    ],
                  ),
                ),
                sw8,
              ],
              Expanded(child: Text(label, style: h5)),
            ],
          ),
        ],
      ),
    );
  }
}
