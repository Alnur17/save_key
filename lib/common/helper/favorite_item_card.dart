import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/widgets/details_widget.dart';
import 'custom_profile_image.dart';

class FavoriteItemCard extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final String itemName;
  final String description;
  final String discount;
  final String status;
  final String date;
  final String startTime;
  final String profileImage;
  final VoidCallback onDelete;

  const FavoriteItemCard({
    super.key,
    required this.imageUrl,
    required this.restaurantName,
    required this.itemName,
    required this.description,
    required this.discount,
    required this.status,
    required this.date,
    required this.startTime,
    required this.profileImage,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8).r,
      padding: EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.silver,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 120.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.grey,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sw12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomProfileImage(imageUrl: profileImage,size: 48,),
                        sw8,
                        Expanded(
                          child: Text(
                            restaurantName,
                            style: h3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    sh5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            itemName,
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
                          decoration: BoxDecoration(
                            color: status.toLowerCase() == 'new deal'
                                ? AppColors.greenLight
                                : AppColors.red.withOpacity(0.4), // Use your red-light color
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            status,
                            style: h4.copyWith(
                              color: status.toLowerCase() == 'new deal'
                                  ? AppColors.greenNormal
                                  : AppColors.red, // Use your red-normal color
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      description,
                      style: h5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
          sh12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    DetailsWidget(
                      iconAsset: AppImages.discount,
                      label: 'Discount',
                      time: discount,
                    ),
                    sh12,
                    DetailsWidget(
                      iconAsset: AppImages.calender,
                      label: 'Date',
                      time: date,
                    ),
                    sh12,
                    DetailsWidget(
                      iconAsset: AppImages.clock,
                      label: 'Start time',
                      time: startTime,
                    ),
                  ],
                ),
              ),
              sw16,
              GestureDetector(
                onTap: onDelete,
                child: Image.asset(
                  AppImages.deleteCircle,
                  scale: 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
