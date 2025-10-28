import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/dashboard/views/dashboard_view.dart';
import 'package:save_key/common/widgets/custom_textfield.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/google_button.dart';
import '../../../local_business/local_business_dashboard/views/local_business_dashboard_view.dart';
import '../../forgot_password/views/forgot_password_view.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
              sh40,
              Image.asset(
                AppImages.logo,
                scale: 4,
              ),
              sh40,
              Text(
                'Login',
                style: h1,
              ),
              sh5,
              Text(
                'Hi Welcome back..! Please enter your correct Information And continue',
                style: h3.copyWith(color: AppColors.black100),
              ),
              sh20,
              Text(
                'Email',
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter your email',
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
              sh20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.checkBox,
                          scale: 4,
                        ),
                      ),
                      sw12,
                      Text(
                        'Remember Me',
                        style: h4.copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ForgotPasswordView());
                    },
                    child: Text(
                      'Forgot password?',
                      style: h4.copyWith(color: AppColors.darkRed),
                    ),
                  ),
                ],
              ),
              sh20,
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  //Get.to(()=> DashboardView());
                  Get.to(()=> LocalBusinessDashboardView());
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
                    'Or',
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
                  Get.to(() => SignupView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: h4,
                    ),
                    Text(
                      'Sign Up',
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
