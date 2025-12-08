import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';

class TopDealsCard extends StatelessWidget {
  final String title;
//  final String category;
  final String redemptions;
  //final String sales;
  final String status;
  final bool isActive;

  const TopDealsCard({
    super.key,
    required this.title,
    //required this.category,
    required this.redemptions,
    //required this.sales,
    required this.status,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets
          .symmetric(horizontal: 12, vertical: 16)
          .r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius
            .circular(12)
            .r,
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: h3),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.splashBackground : AppColors.redLight,
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: Text(
                  status,
                  style: h5.copyWith(
                    color:
                    isActive ? AppColors.greenNormal : AppColors.red,
                  ),
                ),
              ),
            ],
          ),
          // sh5,
          // Text(category, style: h6),
          sh8,
          Text(redemptions, style: h6),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(redemptions, style: h6),
          //     Text(sales, style: h6),
          //   ],
          // ),
        ],
      ),
    );
  }
}
