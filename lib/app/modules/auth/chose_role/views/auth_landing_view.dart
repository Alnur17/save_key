import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/chose_role/controllers/chose_role_controller.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../login/views/login_view.dart';
import '../../signup/views/local_signup_view.dart';
import '../../signup/views/signup_view.dart';

class AuthLandingView extends GetView {

  AuthLandingView({super.key,});

  final ChoseRoleController choseRoleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashLogo,
              scale: 4,
              height: 110,
              width: 110,
            ),
            sh12,
            Text(
              'Discover exclusive local discounts and perks. Sign up today and save while supporting your community.',
              style: h3.copyWith(
                color: AppColors.black100,
              ),
              textAlign: TextAlign.center,
            ),
            sh60,
            CustomButton(
              text: 'Sign In',
              onPressed: () {
                Get.to(() => LoginView());
              },
              gradientColors: AppColors.buttonColor,
            ),
            sh16,
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                if(choseRoleController.selectedIndex.value == 0){
                  Get.to(() => SignupView());
                }else{
                  Get.to(() => LocalSignupView());
                }
              },
              backgroundColor: AppColors.white,
              borderColor: AppColors.greenNormal,
              textColor: AppColors.greenNormal,
            ),
            sh30,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: h5.copyWith(color: AppColors.black100, height: 1.4),
                children: [
                  TextSpan(
                    text:
                    'By signing up you confirm that you have read & agree to our ',
                    style: h5,
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: h5.copyWith(
                      color: AppColors.greenNormal, // your highlighted color
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Get.to(() => const PrivacyPolicyView());
                      },
                  ),
                  TextSpan(
                    text: ' and ',
                    style: h5,
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: h5.copyWith(
                      color: AppColors.greenNormal, // your highlighted color
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //Get.to(() => const TermsConditionsView());
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
