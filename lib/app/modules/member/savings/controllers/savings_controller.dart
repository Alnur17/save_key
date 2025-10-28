import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';

class SavingsController extends GetxController {

  var selectedPeriod = 'This year'.obs;

  final List<Map<String, dynamic>> categories = [
    {'name': 'Gym & Wellness', 'percent': 30, 'color': AppColors.green},
    {'name': 'Retail', 'percent': 20, 'color': Colors.pink},
    {'name': 'Food & Dining', 'percent': 40, 'color': Colors.cyan},
    {'name': 'Entertainment', 'percent': 10, 'color': AppColors.purple},
  ];
}
