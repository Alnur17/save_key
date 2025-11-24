import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/dashboard/views/dashboard_view.dart';
import 'package:save_key/app/modules/member/subscription_plan/views/payment_successful_view.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/widgets/custom_button.dart';
import 'package:save_key/common/widgets/custom_row_header.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/subscription_plan_controller.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});

  @override
  State<SubscriptionPlanView> createState() => _SubscriptionPlanViewState();
}

class _SubscriptionPlanViewState extends State<SubscriptionPlanView> {
  final SubscriptionPlanController subscriptionPlanController =
      Get.put(SubscriptionPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Choose your plan', style: appBarStyle),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          children: [
            sh12,
            Obx(
              () => Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.silver,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          subscriptionPlanController.isFeedSelected.value =
                              true;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: subscriptionPlanController
                                  .isFeedSelected.value
                                  ? AppColors.buttonColor
                                  : AppColors.authBackColor,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Center(
                            child: Text(
                              'Monthly',
                              style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    sw8,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          subscriptionPlanController.isFeedSelected.value =
                              false;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: subscriptionPlanController
                                      .isFeedSelected.value
                                  ? AppColors.authBackColor
                                  : AppColors.buttonColor,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Center(
                            child: Text(
                              'Yearly',
                              style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sh12,
            Obx(() => subscriptionPlanController.isFeedSelected.value
                ? Container(
                    padding: const EdgeInsets.all(12).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: AppColors.buttonColor,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppImages.crown,
                              scale: 4,
                            ),
                            Text(
                              '\$5.00',
                              style: h2,
                            ),
                          ],
                        ),
                        Text(
                          'Monthly plan',
                          style: h2,
                        ),
                        Text(
                          'Enjoy exclusive discounts & perks every month.',
                          style: h5,
                        ),
                        sh12,
                        Text(
                          'Features list',
                          style: h3,
                        ),
                        sh8,
                        // Row(
                        //   children: [
                        //     Image.asset(AppImages.rightChecked,scale: 4,),
                        //     sw5,
                        //     Text('Unlimited access to local discounts & perks',style: h5,)
                        //   ],
                        // ),
                        CustomRowHeader(
                            title:
                                'Unlimited access to local discounts & perks'),
                        sh5,
                        CustomRowHeader(
                            title: 'Digital membership card with QR code'),
                        sh5,
                        CustomRowHeader(
                            title:
                                'Instant discount validation at partner shops'),
                        sh5,
                        CustomRowHeader(
                            title: 'Notifications for new offers & updates'),
                        sh5,
                        CustomRowHeader(
                            title: 'Manage your subscription anytime'),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(12).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: AppColors.buttonColor,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppImages.crown,
                              scale: 4,
                            ),
                            Text(
                              '\$50.00',
                              style: h2,
                            ),
                          ],
                        ),
                        Text(
                          'Yearly plan',
                          style: h2,
                        ),
                        Text(
                          'Enjoy exclusive discounts & perks every month.',
                          style: h5,
                        ),
                        sh12,
                        Text(
                          'Features list',
                          style: h3,
                        ),
                        sh8,
                        // Row(
                        //   children: [
                        //     Image.asset(AppImages.rightChecked,scale: 4,),
                        //     sw5,
                        //     Text('Unlimited access to local discounts & perks',style: h5,)
                        //   ],
                        // ),
                        CustomRowHeader(
                            title:
                                'Unlimited access to local discounts & perks'),
                        sh5,
                        CustomRowHeader(
                            title: 'Digital membership card with QR code'),
                        sh5,
                        CustomRowHeader(
                            title:
                                'Instant discount validation at partner shops'),
                        sh5,
                        CustomRowHeader(
                            title: 'Notifications for new offers & updates'),
                        sh5,
                        CustomRowHeader(
                            title: 'Manage your subscription anytime'),
                      ],
                    ),
                  )),
            sh20,
            CustomButton(
              text: 'Payment Now',
              onPressed: () {
                Get.offAll(() => PaymentSuccessfulView());
              },
              gradientColors: AppColors.buttonColor,
            ),
            sh16,
            CustomButton(
              text: 'Skip',
              onPressed: () {
                Get.offAll(() => DashboardView());
              },
              borderColor: AppColors.greenNormal,
              textColor: AppColors.greenNormal,
            ),
          ],
        ),
      ),
    );
  }
}
