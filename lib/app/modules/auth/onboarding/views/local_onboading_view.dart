import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/onboarding_page.dart';
import '../../chose_role/views/auth_landing_view.dart';

class LocalOnboardingView extends StatefulWidget {
  const LocalOnboardingView({super.key});

  @override
  State<LocalOnboardingView> createState() => _LocalOnboardingViewState();
}

class _LocalOnboardingViewState extends State<LocalOnboardingView> {
  final PageController _pageController = PageController();

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
                title: 'Promote Your Shop Instantly',
                description: 'Reach thousands of users looking for great deals.',
              ),
              OnboardingPage(
                image: AppImages.onboardingImageTwo,
                title: 'Create Discounts on Your Products',
                description: 'Add products and set attractive discounts in seconds.',
              ),
              OnboardingPage(
                image: AppImages.onboardingImageThree,
                title: 'Track Performance & Grow Sales',
                description: 'View analytics, manage offers, and boost sales anytime.',
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
          // Smooth Dot Indicator at the bottom
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
