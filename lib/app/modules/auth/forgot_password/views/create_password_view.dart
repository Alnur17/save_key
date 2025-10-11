import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/forgot_password/views/reset_success_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class CreatePasswordView extends GetView {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Create a password',
          style: appBarStyle,
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh12,
              Text(
                'Please create and enter a new password for your account',
                style: h5.copyWith(color: AppColors.grey),
              ),
              sh16,
              Text(
                'New password',
                style: h4,
              ),
              sh12,
              CustomTextField(
                hintText: '**********',
                sufIcon: Image.asset(
                  AppImages.eyeClose,
                  scale: 4,
                ),
              ),
              sh16,
              Text(
                'Confirm New Password',
                style: h4,
              ),
              sh12,
              CustomTextField(
                sufIcon: Image.asset(
                  AppImages.eyeClose,
                  scale: 4,
                ),
                hintText: '**********',
              ),
              sh16,
              CustomButton(
                text: 'Update',
                onPressed: () {
                  Get.offAll(() => ResetSuccessView());
                },
                gradientColors: AppColors.buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
