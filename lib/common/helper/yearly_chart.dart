import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_text_style/styles.dart';

import '../size_box/custom_sizebox.dart';

class YearlyChart extends StatelessWidget {
  final bool showDropdown;
  final String chartHeader;

  YearlyChart({super.key, this.showDropdown = true, required this.chartHeader});

  final RxString selectedYear = "This year".obs;

  final List<String> yearOptions = ["This year", "Last year"];

  final List<double> savings = [
    150,
    120,
    280,
    160,
    150,
    300,
    100,
    200,
    100,
    100,
    100,
    100
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: showDropdown == true ? 8 : 20,
              bottom: 20)
          .r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: AppColors.greyLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chartHeader,
                style: h3,
              ),
              if (showDropdown)
                Obx(
                  () => Container(
                    height: 35.h,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade100,
                    ),
                    child: DropdownButton<String>(
                      padding: EdgeInsets.zero,
                      dropdownColor: AppColors.white,
                      borderRadius: BorderRadius.circular(20).r,
                      value: selectedYear.value,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      style: h5.copyWith(fontWeight: FontWeight.w400),
                      items: yearOptions
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,style: h4,),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) selectedYear.value = value;
                      },
                    ),
                  ),
                ),
            ],
          ),
          sh16,

          // Chart
          SizedBox(
            height: 250.h,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true, horizontalInterval: 50),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.w,
                      interval: 50,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: h5.copyWith(fontSize: 10.sp),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec'
                        ];
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            months[value.toInt()],
                            style: h5.copyWith(fontSize: 10.sp),
                          ),
                        );
                      },
                      interval: 1,
                    ),
                  ),
                ),
                barGroups: savings.asMap().entries.map((entry) {
                  int index = entry.key;
                  double value = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        color: AppColors.primaryColor ?? Colors.green,
                        width: 14.w,
                        borderRadius: BorderRadius.circular(6).r,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
