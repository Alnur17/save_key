import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:save_key/app/modules/member/account/views/account_view.dart';
import 'package:save_key/common/app_text_style/styles.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../favorite/views/favorite_view.dart';
import '../../home/views/home_view.dart';
import '../../savings/views/savings_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeView(),
      FavoriteView(),
      SavingsView(),
      AccountView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.home,
              scale: 4,
            ),
            sh5,
            Text(
              "Home",
              style: h5,
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
              AppImages.favorite,
              scale: 4,
            ),
            sh5,
            Text(
              "Favorite",
              style: h5,
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
              AppImages.savings,
              scale: 4,
            ),
            sh5,
            Text(
              "Savings",
              style: h5,
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
              style: h5,
            ),
          ],
        ),
        activeColorPrimary: AppColors.greenNormal,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Image.asset(AppImages.home, scale: 4),
  //       //inactiveIcon: Image.asset(AppImages.home, scale: 4),
  //       title: ("Home"),contentPadding: 0,
  //       activeColorPrimary: AppColors.greenNormal,
  //       inactiveColorPrimary: AppColors.transparent,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Image.asset(AppImages.favorite, scale: 4),
  //       //inactiveIcon: Image.asset(AppImages.gallery, scale: 4),
  //       title: ("Favorite"),contentPadding: 0,
  //       activeColorPrimary: AppColors.greenNormal,
  //       inactiveColorPrimary: AppColors.transparent,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Image.asset(AppImages.savings, scale: 4),
  //       //inactiveIcon: Image.asset(AppImages.tags, scale: 4),
  //       title: ("Savings"),contentPadding: 0,
  //       activeColorPrimary: AppColors.greenNormal,
  //       inactiveColorPrimary: AppColors.transparent,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Image.asset(AppImages.profile, scale: 4,width: 32,height: 32,),
  //       //inactiveIcon: Image.asset(AppImages.profile, scale: 4),
  //       title: ("Account"),contentPadding: 0,
  //       activeColorPrimary: AppColors.greenNormal,
  //       inactiveColorPrimary: AppColors.transparent,
  //     ),
  //   ];
  // }

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
