import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import '../../../../../common/helper/category_row.dart';
import '../../../../../common/helper/favorite_category_card.dart';
import '../../../../../common/helper/yearly_chart.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../controllers/savings_controller.dart';
import '../model/persional_stat_card.dart';

class SavingsView extends GetView<SavingsController> {
  const SavingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Personal Analytics', style: appBarStyle),
        titleSpacing: 20.w,
        // leading: GestureDetector(
        //   onTap: Get.back,
        //   child: Image.asset(AppImages.back, scale: 4),
        // ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track your deals, savings, and partner engagement',
              style: h5,
            ),
            sh30,
            Row(
              children: [
                Expanded(
                  child: PersonalStatCard(
                    title: 'Total Saved',
                    amount: '\$245',
                    percentage: '6%',
                    label: 'This Month',
                    iconPath: AppImages.totalSave,
                    isPositive: true,
                  ),
                ),
                sw12,
                Expanded(
                  child: PersonalStatCard(
                    title: 'Deal Redeem',
                    amount: '35',
                    label: 'Redemptions',
                    iconPath: AppImages.dealRedeem,
                    isPositive: true,
                  ),
                ),
              ],
            ),
            sh16,
            Row(
              children: [
                Expanded(
                  child: PersonalStatCard(
                    title: 'Total Visit',
                    amount: '720',
                    label: 'All \nBusiness',
                    percentage: '6%',
                    iconPath: AppImages.totalVisit,
                    isPositive: true,
                  ),
                ),
                sw12,
                Expanded(
                  child: PersonalStatCard(
                    title: 'Avg. Saving',
                    amount: '27',
                    label: 'Different Category',
                    iconPath: AppImages.avgSaving,
                    isPositive: true,
                  ),
                ),
              ],
            ),
            sh30,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                color: AppColors.greyLight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Redemptions by Category',
                    style: h3,
                  ),
                  sh12,
                  CategoryRow(
                    title: 'Food & Dining',
                    value: '58%',
                  ),
                  Divider(),
                  CategoryRow(
                    title: 'Gym & Wellness',
                    value: '26%',
                  ),
                  Divider(),
                  CategoryRow(
                    title: 'Retail',
                    value: '10%',
                  ),
                  Divider(),
                  CategoryRow(
                    title: 'Entertainment',
                    value: '06%',
                  ),
                ],
              ),
            ),
            sh20,
            Text(
              'Overview',
              style: h2.copyWith(fontSize: 22),
            ),
            sh20,
            YearlyChart(
              showDropdown: false,
              chartHeader: 'Yearly Visit Pattern',
            ),
            sh20,
            FavoriteCategoriesCard(),
            sh20,
            YearlyChart(
              showDropdown: true,
              chartHeader: 'Yearly Savings',
            ),
          ],
        ),
      ),
    );
  }
}
