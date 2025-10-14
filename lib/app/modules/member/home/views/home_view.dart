import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/app/modules/member/home/views/discount_details_view.dart';
import 'package:save_key/app/modules/member/home/views/my_search_view.dart';
import 'package:save_key/app/modules/member/home/views/notifications_view.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/custom_textfield.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/custom_filter_chip.dart';
import '../../../../../common/helper/deal_card.dart';
import '../../../../../common/helper/filter_dialog.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 150.h,
        titleSpacing: 20,
        title: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greenLight,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child:
                        CachedNetworkImage(imageUrl: AppImages.profileImageTwo),
                  ),
                ),
                sw8,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: h3,
                        children: [
                          TextSpan(text: 'Hello! '),
                          TextSpan(
                            text: 'Sultan',
                            style: h3.copyWith(
                              color: AppColors.greenNormal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sh5,
                    Text(
                      'MohaKhali, Dhaka',
                      style: h5,
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(()=> NotificationsView());
                  },
                  child: Image.asset(
                    AppImages.notification,
                    scale: 4,
                  ),
                ),
                sw8,
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const FilterDialog(),
                    );
                  },
                  child: Image.asset(
                    AppImages.filter,
                    scale: 4,
                  ),
                )
              ],
            ),
            sh16,
            GestureDetector(
              onTap: () {
                Get.to(()=> MySearchView());
              },
              child: CustomTextField(
                hintText: 'Looking for...',
                isEditable: false,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Text(
              'Category',
              style: h3,
            ),
          ),
          sh12,
          SizedBox(
            height: 35.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: homeController.categories.length,
              itemBuilder: (context, index) {
                final category = homeController.categories[index];
                return Obx(() => CustomFilterChip(
                      text: category,
                      isSelected:
                          homeController.selectedCategory.value == category,
                      onTap: () => homeController.selectCategory(category),
                    ));
              },
            ),
          ),
          sh20,
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index == 5 - 1 ? 20 : 8,
                ),
                child: DealCard(
                  mainImage: AppImages.foodImage,
                  profileImage: AppImages.profileImageTwo,
                  restaurantName: 'Daily Daawat - Gulshan 1',
                  foodName: 'Vegetable Burger',
                  description:
                      'A veggie burger is a plant-based patty served in a burger bun, made from ingredients like vegetables and legumes.',
                  discount: '20%',
                  date: '23 Sep 2025',
                  startTime: '03:00 PM',
                  dealType: 'New Deal',
                  savedAmount: 'Saved \$20',
                  onDetailsTap: () {
                    Get.to(()=> DiscountDetailsView());
                  },
                  onScannerTap: () {},
                  onBookmarkTap: () {},
                  onViewTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
