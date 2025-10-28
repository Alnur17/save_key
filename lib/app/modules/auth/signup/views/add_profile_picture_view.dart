import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/setup_your_business/views/setup_your_business_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_button.dart';

import '../../../../../common/helper/custom_profile_image.dart';
import '../../../member/subscription_plan/views/subscription_plan_view.dart';

class AddProfilePictureView extends GetView {
  final bool isMember;

  const AddProfilePictureView({super.key, required this.isMember});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Add Profile Picture',
          style: appBarStyle,
        ),
        titleSpacing: 20,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Everyone will be able to see your picture.',
                style: h4,
              ),
            ),
            sh20,
            CustomProfileImage(imageUrl: AppImages.profileImageTwo),
            Spacer(),
            CustomButton(
              text: 'Add Picture',
              onPressed: () {},
              gradientColors: AppColors.buttonColor,
            ),
            sh16,
            CustomButton(
              text: 'Skip',
              onPressed: () {
                if (isMember == true) {
                  Get.to(() => SubscriptionPlanView());
                } else {
                  Get.to(() => SetupYourBusinessView());
                }
              },
              backgroundColor: AppColors.transparent,
              borderColor: AppColors.greenNormal,
              textColor: AppColors.greenNormal,
            ),
            sh20,
          ],
        ),
      ),
    );
  }
}
