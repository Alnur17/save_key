import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/member/savings/controllers/savings_controller.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class FavoriteCategoriesCard extends GetView {
  FavoriteCategoriesCard({super.key});

  final SavingsController savingsController = Get.put(SavingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favorite Categories',
                style: h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Obx(() => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: DropdownButton<String>(
                  value: savingsController.selectedPeriod.value,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                  underline: const SizedBox(),
                  isDense: true,
                  dropdownColor: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  items: ['This year', 'This month', 'This week']
                      .map((value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: h5.copyWith(color: Colors.black),
                    ),
                  ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      savingsController.selectedPeriod.value = value;
                    }
                  },
                ),
              )),
            ],
          ),
          sh16,
          SizedBox(
            height: 200.h,
            child: PieChart(
              PieChartData(
                //sectionsSpace: 4.w,
                centerSpaceRadius: 0,
                sections: savingsController.categories
                    .map(
                      (e) => PieChartSectionData(
                    color: e['color'],
                    value: e['percent'].toDouble(),
                    showTitle: false,
                    radius: 90.r,
                  ),
                )
                    .toList(),
              ),
            ),
          ),
          sh16,
          Wrap(
            spacing: 16.w,
            runSpacing: 8.h,
            children: savingsController.categories
                .map(
                  (e) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 6.r,
                    backgroundColor: e['color'],
                  ),
                  sw5,
                  Text(
                    '${e['name']}: ${e['percent']}%',
                    style: h5,
                  ),
                ],
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
