import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/const_text/const_text.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class TermsAndConditionView extends GetView {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Text(
          'Terms and Condition',
          style: appBarStyle,
        ),
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
              termsIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
            sh24,
            Text(
              termsIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
            sh24,
            Text(
              termsIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
            sh24,
            Text(
              termsIntroduction,
              style: h4.copyWith(
                fontSize: 14,
              ),
            ),
            sh24,
            Text(
              termsIntroduction,
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
