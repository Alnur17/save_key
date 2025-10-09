import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/auth/chose_role/views/chose_role_view.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/widgets/custom_background_image.dart';
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundImage(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                OnboardingPage(
                  image: AppImages.onboardingImageOne,
                  title: 'Discover local savings',
                  description:
                      'Unlock exclusive discounts and perks at your favorite local businesses. Save more while supporting your community—all in one app.',
                ),
                OnboardingPage(
                  image: AppImages.onboardingImageTwo,
                  title: 'Easy Membership Access',
                  description:
                      'Choose a plan that fits you best. Get your digital membership with a unique QR code for instant discount validation.',
                ),
                OnboardingPage(
                  image: AppImages.onboardingImageThree,
                  title: 'Manage & Stay Updated',
                  description:
                      'Track your perks, receive real-time updates, and enjoy a smooth, secure shopping experience every time you use the app.',
                ),
              ],
            ),
            // Smooth Dot Indicator at the bottom
            Positioned(
              bottom: 85,
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
              bottom: 20,
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
                      Get.to(() => ChoseRoleView());
                    }
                  }
                },
                text: 'Next',
                gradientColors: AppColors.buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
