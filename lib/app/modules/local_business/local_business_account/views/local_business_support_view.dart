import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class LocalBusinessSupportView extends GetView {
  const LocalBusinessSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Contact Us',
        ),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh12,
            Text(
              'Get in Touch',
              style: h3,
            ),
            sh5,
            Text(
              'We\'d love to hear from you!',
              style: h5.copyWith(color: AppColors.greyMedium),
            ),
            sh20,
            Text('Email Address', style: h4),
            sh8,
            CustomTextField(
              borderRadius: 12,
              hintText: 'Enter your email address',
            ),
            sh12,
            Text('Subject', style: h4),
            sh8,
            CustomTextField(
              borderRadius: 12,
              hintText: 'What\'s your message about?',
            ),
            sh12,
            Text('Message', style: h4),
            sh8,
            CustomTextField(
              borderRadius: 12,
              height: 150,
              hintText: 'Type your message here...',
            ),
            sh12,
            CustomButton(
              text: 'Send Message',
              onPressed: () {},
              gradientColors: AppColors.buttonColor,
            ),
            sh30,
            Row(
              children: [
                Image.asset(
                  AppImages.email,
                  scale: 4,
                ),
                sw5,
                Text(
                  'support@Yalla.com',
                  style: h5,
                ),
              ],
            ),
            sh12,
            Row(
              children: [
                Image.asset(
                  AppImages.call,
                  scale: 4,
                ),
                sw5,
                Text(
                  '+1 (234) 567-890',
                  style: h5,
                ),
              ],
            ),
            sh12
          ],
        ),
      ),
    );
  }
}
