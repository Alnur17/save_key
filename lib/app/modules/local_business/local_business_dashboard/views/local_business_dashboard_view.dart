import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:save_key/app/modules/local_business/deals/views/deals_view.dart';
import 'package:save_key/app/modules/local_business/insights/views/insights_view.dart';
import 'package:save_key/app/modules/local_business/local_business_home/views/local_business_home_view.dart';
import 'package:save_key/app/modules/local_business/scan/views/scan_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../local_business_account/views/local_business_account_view.dart';

class LocalBusinessDashboardView
    extends StatefulWidget {
  const LocalBusinessDashboardView({super.key});

  @override
  State<LocalBusinessDashboardView> createState() => _LocalBusinessDashboardViewState();
}

class _LocalBusinessDashboardViewState extends State<LocalBusinessDashboardView> {
  final PersistentTabController controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      LocalBusinessHomeView(),
      DealsView(),
      ScanView(),
      InsightsView(),
      LocalBusinessAccountView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.dashboard,
              scale: 4,
            ),
            sh5,
            Text(
              "Dashboard",
              style: h6,
            ),
          ],
        ),
        activeColorPrimary: AppColors.greenNormal,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.deals,
              scale: 4,
            ),
            sh5,
            Text(
              "Deals",
              style: h6,
            ),
          ],
        ),
        activeColorPrimary: AppColors.greenNormal,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.scan,
              scale: 4,
            ),
            sh5,
            Text(
              "Scan",
              style: h6,
            ),
          ],
        ),
        activeColorPrimary: AppColors.greenNormal,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.insights,
              scale: 4,
            ),
            sh5,
            Text(
              "Insights",
              style: h6,
            ),
          ],
        ),
        activeColorPrimary: AppColors.greenNormal,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.profile,
              scale: 4,
            ),
            sh5,
            Text(
              "Account",
              style: h6,
            ),
          ],
        ),
        activeColorPrimary: AppColors.greenNormal,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PersistentTabView(
        padding: EdgeInsets.only(bottom: 8),
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: AppColors.bottomNavbar,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarStyle: NavBarStyle.style3,
        navBarHeight: 75.h, // Taller navbar
      ),
    );
  }
}