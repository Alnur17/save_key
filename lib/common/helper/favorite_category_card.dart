import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';

class FavoriteCategoriesCard extends StatefulWidget {
  const FavoriteCategoriesCard({super.key});

  @override
  State<FavoriteCategoriesCard> createState() => _FavoriteCategoriesCardState();
}

class _FavoriteCategoriesCardState extends State<FavoriteCategoriesCard> {
  String selectedPeriod = 'This year';

  final List<Map<String, dynamic>> categories = [
    {'name': 'Gym & Wellness', 'percent': 30, 'color': AppColors.green},
    {'name': 'Retail', 'percent': 20, 'color': Colors.pink},
    {'name': 'Food & Dining', 'percent': 40, 'color': Colors.cyan},
    {'name': 'Entertainment', 'percent': 10, 'color': AppColors.purple},
  ];

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
          /// Title + Dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favorite Categories',
                style: h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: DropdownButton<String>(
                  value: selectedPeriod,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                  underline: const SizedBox(),
                  isDense: true,
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  items: ['This year', 'This month', 'This week']
                      .map((value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: h5.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPeriod = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          /// Pie Chart
          SizedBox(
            height: 180.h,
            child: PieChart(
              PieChartData(
                sectionsSpace: 4.w,
                centerSpaceRadius: 0,
                sections: categories
                    .map(
                      (e) => PieChartSectionData(
                    color: e['color'],
                    value: e['percent'].toDouble(),
                    showTitle: false,
                    radius: 50.r,
                  ),
                )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          /// Legends
          Wrap(
            spacing: 16.w,
            runSpacing: 8.h,
            children: categories
                .map(
                  (e) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 6.r,
                    backgroundColor: e['color'],
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '${e['name']}: ${e['percent']}%',
                    style: h5.copyWith(fontWeight: FontWeight.w500),
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
