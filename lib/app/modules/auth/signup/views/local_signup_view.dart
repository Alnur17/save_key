import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/login/views/login_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../../../../common/widgets/google_button.dart';
import 'add_profile_picture_view.dart';

class LocalSignupView extends GetView {
  const LocalSignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
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
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh20,
              Image.asset(
                AppImages.logo,
                scale: 4,
              ),
              sh40,
              Text(
                'Create account',
                style: h1,
              ),
              sh5,
              Text(
                'Fill your information below or register with your account.',
                style: h3.copyWith(color: AppColors.black100),
              ),
              sh20,
              Text(
                'Business Name',
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter business name',
              ),
              sh12,
              Text(
                'Email',
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter email',
              ),
              sh12,
              Text(
                'Owner Contact',
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter number',
              ),
              sh12,
              Text(
                'Password',
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh8,
              CustomTextField(
                hintText: '***********',
              ),
              sh12,
              Text(
                'Confirm Password',
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh8,
              CustomTextField(
                hintText: '***********',
              ),
              sh20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AppImages.checkBox,
                      scale: 4,
                    ),
                  ),
                  sw12,
                  RichText(
                    text: TextSpan(
                      style: h4.copyWith(color: AppColors.grey),
                      children: [
                        const TextSpan(text: 'By agreeing to the '),
                        TextSpan(
                          text: 'Terms & Condition',
                          style: h4.copyWith(color: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to terms view
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              sh20,
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Get.to(()=> AddProfilePictureView(isMember: false,));
                },
                gradientColors: AppColors.buttonColor,
              ),
              sh12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider()),
                  sw10,
                  Text(
                    'Continue',
                    style: h4,
                  ),
                  sw10,
                  const Expanded(child: Divider()),
                ],
              ),
              sh20,
              GoogleButton(
                assetPath: AppImages.google,
                // label: authController.isLoadingGoogle.value
                //     ? 'Loading...'
                //     :
                label: 'Continue with Google',
                onTap: () {
                  //authController.loginWithGoogle();
                },
              ),
              sh12,
              GoogleButton(
                assetPath: AppImages.apple,
                // label: authController.isLoadingApple.value
                //     ? 'Loading...'
                label: 'Continue with Apple',
                onTap: () {
                  //authController.loginWithApple();
                },
              ),
              sh20,
              GestureDetector(
                onTap: () {
                  Get.to(() => LoginView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: h4,
                    ),
                    Text(
                      'Sign In',
                      style: h3.copyWith(color: AppColors.textColor),
                    ),
                  ],
                ),
              ),
              sh20,
            ],
          ),
        ),
      ),
    );
  }
}
