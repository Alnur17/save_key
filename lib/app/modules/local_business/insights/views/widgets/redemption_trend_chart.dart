import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_key/app/modules/local_business/insights/controllers/insights_controller.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';

import 'chart_container.dart';

class RedemptionTrendChart extends StatelessWidget {
  RedemptionTrendChart({super.key});

  final InsightsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Redemption Trend',
      trailing: _buildDropdown(),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 20.w, bottom: 10.h, top: 10.h),
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 3,
            minY: 0,
            gridData: FlGridData(
              show: true,
              horizontalInterval: 50,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              ),
              getDrawingVerticalLine: (value) => FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400, width: 1),
                left: BorderSide(color: Colors.grey.shade400, width: 1),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

              // Y-Axis Titles
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 35.w,
                  interval: 50,
                  getTitlesWidget: (value, _) => Text(
                    value.toInt().toString(),
                    style: h5.copyWith(fontSize: 10.sp),
                  ),
                ),
              ),

              // X-Axis Titles (with padding fix)
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 20.h, // extra space to prevent overflow
                  getTitlesWidget: (value, _) {
                    const labels = ['1 week', '2 week', '3 week', '4 week'];
                    if (value.toInt() < 0 || value.toInt() >= labels.length) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        labels[value.toInt()],
                        style: h5.copyWith(fontSize: 10.sp),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Smooth Line
            lineBarsData: [
              LineChartBarData(
                spots: controller.redemptionTrend
                    .asMap()
                    .entries
                    .map((e) => FlSpot(e.key.toDouble(), e.value))
                    .toList(),
                isCurved: true,
                color: AppColors.greenNormal,
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  color: AppColors.greenNormal.withOpacity(0.2),
                ),
                dotData: FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: DropdownButton<String>(
          value: controller.selectedPeriod.value,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
          underline: const SizedBox(),
          isDense: true,
          dropdownColor: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          items: ['This month', 'Last month']
              .map(
                (value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: h5.copyWith(color: Colors.black)),
            ),
          )
              .toList(),
          onChanged: (value) {
            if (value != null) controller.selectedPeriod.value = value;
          },
        ),
      );
    });
  }
}
