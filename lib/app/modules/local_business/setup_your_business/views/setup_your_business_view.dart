import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/auth_landing/views/auth_landing_view.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import 'package:save_key/common/widgets/custom_textfield.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/setup_your_business_controller.dart';

class SetupYourBusinessView extends GetView<SetupYourBusinessController> {
  const SetupYourBusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Setup Your Business',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh16,
              Text(
                'Business Address',
                style: h3,
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter Your address',
              ),
              sh20,
              Text(
                'Description',
                style: h3,
              ),
              sh8,
              CustomTextField(
                height: 100,
                hintText: 'Write here...',
              ),
              sh20,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Open time',
                          style: h3,
                        ),
                        sh8,
                        CustomTextField(
                          hintText: 'Enter Your address',
                        ),
                      ],
                    ),
                  ),
                  sw8,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Close time',
                          style: h3,
                        ),
                        sh8,
                        CustomTextField(
                          hintText: '09:00 PM',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              sh20,
              Text(
                'Website',
                style: h3,
              ),
              sh8,
              CustomTextField(
                hintText: 'www.abc.com',
              ),
              sh20,
              Text(
                'Linkedin',
                style: h3,
              ),
              sh8,
              CustomTextField(
                hintText: 'www.linkedin.com/username',
              ),
              sh20,
              Text(
                'Facebook',
                style: h3,
              ),
              sh8,
              CustomTextField(
                hintText: 'www.facebook.com/username',
              ),
              CustomButton(
                text: 'Request',
                onPressed: () {},
                gradientColors: AppColors.buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
