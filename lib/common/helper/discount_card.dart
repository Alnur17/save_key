import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/widgets/custom_button.dart';

import '../size_box/custom_sizebox.dart';

class DiscountCard extends StatelessWidget {
  final String image;
  final String title;
  final String offer;
  final String usage;
  final String infoTitle;
  final String infoValue;
  final bool isBookmarked;
  final VoidCallback? onCardTap;
  final VoidCallback? onButtonTap; // OPTIONAL

  const DiscountCard({
    super.key,
    required this.image,
    required this.title,
    required this.offer,
    required this.usage,
    required this.infoTitle,
    required this.infoValue,
    this.isBookmarked = false,
    this.onButtonTap,     // OPTIONAL
    this.onCardTap,       // OPTIONAL
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16).r,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -------- TOP SECTION --------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// CachedNetworkImage
                ClipRRect(
                  borderRadius: BorderRadius.circular(12).r,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    height: 110.h,
                    width: 80.w,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(
                      height: 110.h,
                      width: 80.w,
                      color: Colors.grey.shade200,
                    ),
                    errorWidget: (_, __, ___) => Container(
                      height: 110.h,
                      width: 80.w,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                ),

                sw12,

                /// Text Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: h3),
                      sh5,
                      Text(offer, style: h5),
                      sh5,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("You've used:", style: h6),
                          Text(
                            usage,
                            style: h6.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      sh5,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$infoTitle:", style: h6),
                          Expanded(
                            child: Text(
                              infoValue,
                              textAlign: TextAlign.right,
                              style: h6.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Bookmark icon
                Image.asset(
                  isBookmarked
                      ? AppImages.bookmarkCircleFilled
                      : AppImages.bookmarkCircle,
                  scale: 4,
                ),
              ],
            ),

            if (onButtonTap != null) sh12,

            /// -------- OPTIONAL BUTTON --------
            if (onButtonTap != null)
              CustomButton(
                text: "Use Discount",
                onPressed: onButtonTap!,
                gradientColors: AppColors.buttonColor,
              ),
          ],
        ),
      ),
    );
  }
}
