import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/auth_landing/views/auth_landing_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/const_text/const_text.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class PrivacyAndPolicyView extends GetView {
  const PrivacyAndPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Text('Privacy and Policy',style: appBarStyle,),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12).r,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              policyIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
            sh24,
            Text(
              policyIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
            sh24,
            Text(
              policyIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
            sh24,
            Text(
              policyIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ), sh24,
            Text(
              policyIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}