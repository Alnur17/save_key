import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/dashboard/views/dashboard_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';

class PaymentSuccessfulView extends GetView {
  const PaymentSuccessfulView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.success,
              scale: 4,
            ),
            sh20,
            Text(
              'Your payment is Successful',
              style: h2,
            ),
            sh5,
            Text(
              'Your subscription is now active. You can now start enjoying exclusive discounts and perks.',
              style: h5,
              textAlign: TextAlign.center,
            ),
            sh20,
            CustomButton(
              text: 'Download Receipt',
              onPressed: () {},
              gradientColors: AppColors.buttonColor,
            ),
            sh16,
            CustomButton(
              text: 'Back to Home',
              onPressed: () {
                Get.offAll(() => DashboardView());
              },
              borderColor: AppColors.greenNormal,
            ),
          ],
        ),
      ),
    );
  }
}
