import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/size_box/custom_sizebox.dart';

class RequestSubmittedView extends GetView {
  const RequestSubmittedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Request Submitted',
          style: appBarStyle,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.approveImage,
                scale: 4,
              ),
              sh20,
              Text(
                'Thank you for signing up!',
                style: h2,
              ),
              sh5,
              Text(
                'Your business profile is under review by our admin team.',
                style: h5,
                textAlign: TextAlign.center,
              ),
              sh5,
              Text(
                'Once approved, you’ll be able to create deals, track redemptions, and access your dashboard.',
                style: h5,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
