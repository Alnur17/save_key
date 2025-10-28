import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/insights/controllers/insights_controller.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import '../../../../../../common/app_text_style/styles.dart';
import 'chart_container.dart';
import 'legend_item.dart';

class LoyaltyPieChart extends StatelessWidget {
  LoyaltyPieChart({super.key});

  final InsightsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20).r,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customer Loyalty Breakdown',style: h4.copyWith(fontWeight: FontWeight.w600)),
          ChartContainer(
            title: '',
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 0,
                sections: [
                  PieChartSectionData(
                    value: controller.loyalty['Repeat Customer'],
                    color: AppColors.greenNormal,
                    title: '',
                    radius: 90.r,
                  ),
                  PieChartSectionData(
                    value: controller.loyalty['New Customer'],
                    color: AppColors.purple,
                    title: '',
                    radius: 90.r,
                  ),
                ],
              ),
            ),
          ),
          Wrap(
            spacing: 16.w,
            runSpacing: 8.h,
            children: const [
              LegendItem(color: AppColors.greenNormal, text: 'Repeat Customer: 70%'),
              LegendItem(color: AppColors.purple, text: 'New Customer: 30%'),
            ],
          ),
        ],
      ),
    );
  }
}
