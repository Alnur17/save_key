import 'package:get/get.dart';

class InsightsController extends GetxController {
  final RxString selectedPeriod = 'This month'.obs;

  final List<double> redemptionTrend = [100, 150, 120, 250];
  final Map<String, double> usageByTime = {
    'Morning': 200,
    'Afternoon': 700,
    'Evening': 450
  };
  final Map<String, double> loyalty = {
    'Repeat Customer': 70,
    'New Customer': 30
  };
}
