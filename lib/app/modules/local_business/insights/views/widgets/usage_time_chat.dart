import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/app/modules/local_business/insights/controllers/insights_controller.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';

import 'chart_container.dart';

class UsageTimeChart extends StatelessWidget {
  UsageTimeChart({super.key});

  final InsightsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Usage by Time of Day – This Month',
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 1),
              left: BorderSide(color: Colors.black, width: 1),   // Y-axis
              top: BorderSide(color: Colors.transparent),
              right: BorderSide(color: Colors.transparent),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            horizontalInterval: 20, // interval between Y-axis lines
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.shade300, // light gray for better visibility
              strokeWidth: 1,
            ),
            drawVerticalLine: true,
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 100, // match horizontal lines
                reservedSize: 40, // space for the numbers
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: h6,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text('Morning', style: h6);
                    case 1:
                      return Text('Afternoon', style: h6);
                    case 2:
                      return Text('Evening', style: h6);
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: controller.usageByTime['Morning']!,
                  color: AppColors.greenNormal,
                  width: 30.w,
                  borderRadius: BorderRadius.circular(6).r,
                )
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: controller.usageByTime['Afternoon']!,
                  color: AppColors.greenNormal,
                  width: 30.w,
                  borderRadius: BorderRadius.circular(6).r,
                )
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: controller.usageByTime['Evening']!,
                  color: AppColors.greenNormal,
                  width: 30.w,
                  borderRadius: BorderRadius.circular(6).r,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
