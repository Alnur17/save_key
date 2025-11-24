import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/deals/views/create_deals_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/widgets/custom_button.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/helper/approved_discount_card.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/deals_controller.dart';

class DealsView extends GetView<DealsController> {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        titleSpacing: 20.w,
        toolbarHeight: 90.h,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deals Management', style: appBarStyle),
                sh5,
                Text(
                  '06 Active deals',
                  style: h5,
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => CreateDealsView());
              },
              child: Image.asset(
                AppImages.addCircle,
                scale: 4,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12).r,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ApprovalDiscountCard(
              imageUrl: AppImages.foodImage,
              title: "Pizza Palace",
              offer: "20% Off All Beverages",
              usageCount: "5",
              location: "Mohakhali, Dhaka",
              status: "Approved",
              statusBgColor: AppColors.greenLight,
              statusTextColor: AppColors.greenNormal,
              onEdit: () {
                print("Edit tapped");
              },
              onDelete: () {
                print("Delete tapped");
              },
            ),

          ],
        ),
      ),
    );
  }
}
