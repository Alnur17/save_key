import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/insights/views/widgets/loyalty_pie_chart.dart';
import 'package:save_key/app/modules/local_business/insights/views/widgets/redemption_trend_chart.dart';
import 'package:save_key/app/modules/local_business/insights/views/widgets/usage_time_chat.dart';
import 'package:save_key/common/widgets/custom_button.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/insights_controller.dart';

class InsightsView extends StatefulWidget {
  const InsightsView({super.key});

  @override
  State<InsightsView> createState() => _InsightsViewState();
}

class _InsightsViewState extends State<InsightsView> {
  final controller = Get.put(InsightsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Analytics',
              style: appBarStyle,
            ),
            Text(
              'Business performance insights',
              style: h6,
            ),
          ],
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RedemptionTrendChart(),
              sh16,
              UsageTimeChart(),
              sh16,
              LoyaltyPieChart(),
              sh20,
              CustomButton(
                text: 'Export Analytics to CSV',
                onPressed: () {},
                gradientColors: AppColors.buttonColor,
                centerImageWithText: true,
                imageAssetPath: AppImages.download,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
