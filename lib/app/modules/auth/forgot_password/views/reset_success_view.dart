import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../login/views/login_view.dart';

class ResetSuccessView extends GetView {
  const ResetSuccessView({super.key});
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
                'Password Reset Successfully',
                style: h2,
                textAlign: TextAlign.center,
              ),
              sh5,
              Text(
                'Now you can login by using your new password',
                style: h5,
                textAlign: TextAlign.center,
              ),
              sh20,
              CustomButton(
                text: 'Go to Login',
                onPressed: () {
                  Get.offAll(()=> LoginView());
                },
                gradientColors: AppColors.buttonColor,
              ),
            ],
          ),
        ),

    );
  }
}