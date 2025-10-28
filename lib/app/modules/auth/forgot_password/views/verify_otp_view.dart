import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:save_key/app/modules/auth/forgot_password/views/create_password_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';

class VerifyOtpView extends GetView {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Confirmation code',
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
                'To confirm your account, enter the 6-digit code we sent to shahidhasn@gmail.com',
                style: h5.copyWith(color: AppColors.grey),
              ),
              sh20,
              Text(
                'Enter OTP',
                style: h5,
              ),
              sh8,
              PinCodeTextField(
                length: 6,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 60,
                  fieldWidth: 50,
                  // Reduce the width slightly for the gap
                  activeColor: AppColors.transparent,
                  activeFillColor: AppColors.greenLight,
                  inactiveColor: AppColors.transparent,
                  inactiveFillColor: AppColors.textFieldBag,
                  selectedColor: AppColors.transparent,
                  selectedFillColor: AppColors.silver,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: AppColors.transparent,
                cursorColor: AppColors.blue,
                enablePinAutofill: true,
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  log("Allowing to paste $text");
                  return true;
                },
                appContext: context,
              ),
              sh20,
              Row(
                children: [
                  Text(
                    'Resent Code',
                    style: h5,
                  ),
                  sw5,
                  Text(
                    '59s',
                    style: h4.copyWith(color: Colors.green),
                  )
                ],
              ),
              sh30,
              CustomButton(
                text: 'Next',
                onPressed: () {
                  Get.to(() => const CreatePasswordView());
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
