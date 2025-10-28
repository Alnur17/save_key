import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/forgot_password/views/verify_otp_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Forgot password',
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
          padding: EdgeInsets.symmetric(horizontal: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh12,
              Text(
                'Please enter your email address which was used to create your account ',
                style: h5.copyWith(color: AppColors.grey),
              ),
              sh30,
              Text(
                'Email',
                style: h4,
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter your email',
              ),
              sh30,
              CustomButton(
                text: 'Send Code',
                onPressed: () {
                  Get.to(() => VerifyOtpView());
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
