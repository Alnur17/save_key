import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/widgets/custom_background_image.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/onboarding_page.dart';
import '../../chose_role/views/chose_role_view.dart';

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
      body: CustomBackgroundImage(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                OnboardingPage(
                  image: AppImages.onboardingImageOne,
                  title: 'Manage Your Deals Easily',
                  description:
                  'Create, edit, and schedule exclusive discounts. Control visibility and keep your offers up to date.',
                ),
                OnboardingPage(
                  image: AppImages.onboardingImageTwo,
                  title: 'Track Performance & Insights',
                  description:
                  'Monitor redemptions, top-performing deals, and usage trends. Export detailed reports to understand your customers better.',
                ),
                OnboardingPage(
                  image: AppImages.onboardingImageThree,
                  title: 'Build Your Brand Profile',
                  description:
                  'Upload logo, banners, and business details. Connect with more customers while we handle approvals.',
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