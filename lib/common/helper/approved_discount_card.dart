import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';

class ApprovalDiscountCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String offer;
  final String usageCount;
  final String location;
  final String status;
  final Color statusBgColor;
  final Color statusTextColor;

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ApprovalDiscountCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.offer,
    required this.usageCount,
    required this.location,
    required this.status,
    required this.statusBgColor,
    required this.statusTextColor,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: AppColors.greyLight,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 120.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8).r,
                  color: AppColors.silver,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8).r,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sw8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: h3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        sw5,
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 30.h,
                          color: statusBgColor,
                          child: Text(
                            status,
                            style: h4.copyWith(
                              color: statusTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sh8,
                    Text(
                      offer,
                      style: h6,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sh12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('User can use this discount: ', style: h6),
                        Text(usageCount,
                            style: h6.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    sh12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Location: ', style: h6),
                        Text(location,
                            style: h6.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          sh12,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: onEdit,
                  text: 'Edit',
                  gradientColors: AppColors.buttonColor,
                ),
              ),
              sw12,
              Expanded(
                child: CustomButton(
                  onPressed: onDelete,
                  text: 'Delete',
                  backgroundColor: AppColors.darkRed,
                  textColor: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
