import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';
import '../widgets/custom_button.dart';
import 'custom_profile_image.dart'; // for sh20, sw8, etc.

class DealCard extends StatelessWidget {
  final String mainImage;
  final String profileImage;
  final String restaurantName;
  final String foodName;
  final String description;
  final String discount;
  final String date;
  final String startTime;
  final String dealType; // e.g. 'New Deal'
  final String savedAmount; // e.g. 'Saved $20'
  final VoidCallback onDetailsTap;
  final VoidCallback onScannerTap;
  final VoidCallback onBookmarkTap;
  final VoidCallback? onViewTap;

  const DealCard({
    super.key,
    required this.mainImage,
    required this.profileImage,
    required this.restaurantName,
    required this.foodName,
    required this.description,
    required this.discount,
    required this.date,
    required this.startTime,
    required this.dealType,
    required this.savedAmount,
    required this.onDetailsTap,
    required this.onScannerTap,
    required this.onBookmarkTap,
    this.onViewTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.textFieldBag,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.silver,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: mainImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.greenLight,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16).r,
                  alignment: Alignment.center,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppColors.greenLight,
                  ),
                  child: Text(
                    savedAmount,
                    style: h5.copyWith(
                      color: AppColors.greenNormal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20).r,
            child: Column(
              children: [
                Row(
                  children: [
                    CustomProfileImage(imageUrl: profileImage,size: 40,),
                    sw8,
                    Expanded(
                      child: Text(
                        restaurantName,
                        style: h3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    sw8,
                    Image.asset(AppImages.location, scale: 4),
                    sw5,
                    GestureDetector(
                      onTap: onViewTap,
                      child: Text(
                        'View',
                        style: h5.copyWith(
                          color: AppColors.green,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.greenNormal,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                sh20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        foodName,
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
                      color: AppColors.greenLight,
                      child: Text(
                        dealType,
                        style: h4.copyWith(color: AppColors.greenNormal),
                      ),
                    ),
                  ],
                ),
                sh12,
                Text(
                  description,
                  style: h5,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                sh16,
                _buildListTile(AppImages.discount, 'Discount', discount),
                _buildListTile(AppImages.calender, 'Date', date),
                _buildListTile(AppImages.clock, 'Start time', startTime),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Details',
                        onPressed: onDetailsTap,
                        imageAssetPath: AppImages.details,
                        centerImageWithText: true,
                        gradientColors: AppColors.buttonColor,
                      ),
                    ),
                    sw8,
                    GestureDetector(
                      onTap: onScannerTap,
                      child: Image.asset(AppImages.scanner, scale: 4),
                    ),
                    sw8,
                    GestureDetector(
                      onTap: onBookmarkTap,
                      child: Image.asset(AppImages.bookmarkCircle, scale: 4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String icon, String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(icon, scale: 4),
      title: Text(title, style: h5),
      trailing: Text(value, style: h5),
    );
  }
}
