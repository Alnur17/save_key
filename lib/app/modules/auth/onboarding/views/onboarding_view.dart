import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/chose_role/controllers/chose_role_controller.dart';
import 'package:save_key/app/modules/auth/chose_role/views/auth_landing_view.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  final ChoseRoleController choseRoleController = Get.find();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingPage(
                image: AppImages.onboardingImageOne,
                title: 'Discover Discounts Nearby',
                description: 'Find the best discounts from shops around you.',
              ),
              OnboardingPage(
                image: AppImages.onboardingImageTwo,
                title: 'Get Exclusive Membership Benefits',
                description: 'Unlock premium deals with membership.',
              ),
              OnboardingPage(
                image: AppImages.onboardingImageThree,
                title: 'Redeem Discounts Instantly',
                description: 'Show the discount screen at the shop & redeem in one tap.',
              ),
            ],
          ),
          Positioned(
            top: 60.h,
            right: 20.w,
            child: GestureDetector(
                onTap: () {
                  Get.to(() => AuthLandingView());
                },
                child: Text(
                  'Skip',
                  style: h3.copyWith(color: AppColors.greenNormal),
                )),
          ),
          Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: AppColors.greenLight,
                  activeDotColor: AppColors.greenNormal,
                  dotHeight: 8,
                  dotWidth: 12,
                  spacing: 8,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 60,
            child: CustomButton(
              onPressed: () {
                if (_pageController.page != null) {
                  final nextPage = (_pageController.page! + 1).toInt();
                  if (nextPage < 3) {
                    _pageController.animateToPage(
                      nextPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Get.to(() => AuthLandingView());
                  }
                }
              },
              text: 'Next',
              gradientColors: AppColors.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
