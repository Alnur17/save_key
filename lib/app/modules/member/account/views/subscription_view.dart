import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/subscription_plan/views/subscription_plan_view.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_button.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';

class SubscriptionView extends GetView {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Subscription', style: appBarStyle),
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
            sh20,
            Text(
              'Current Plan',
              style: h2.copyWith(fontSize: 22.sp),
            ),
            sh12,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.greyLight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.crown,
                        scale: 4,
                      ),
                      sw8,
                      Text(
                        '\$50/Mothly',
                        style: h3.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                  sh5,
                  Text(
                    '19 days remaining',
                    style: h3,
                  ),
                ],
              ),
            ),
            sh20,
            CustomButton(
              text: 'Update Plan',
              onPressed: () {
                Get.to(()=> SubscriptionPlanView());
              },
              gradientColors: AppColors.buttonColor,
            ),
            sh20,
            CustomButton(
              text: 'Cancel Plan',
              onPressed: () {},
              borderColor: AppColors.greenNormal,
              textColor: AppColors.greenNormal,
            ),
          ],
        ),
      ),
    );
  }
}
