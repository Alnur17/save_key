import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/helper/discount_card.dart';
import '../../../../../common/helper/favorite_item_card.dart';
import '../../home/views/discount_details_view.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Favorite', style: appBarStyle),
        titleSpacing: 20.w,
        // leading: GestureDetector(
        //   onTap: Get.back,
        //   child: Image.asset(AppImages.back, scale: 4),
        // ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            bottom: index == 5 - 1 ? 20 : 8,
          ),
          child: DiscountCard(
            image: "https://picsum.photos/200",
            title: "Cappuccino Coffee",
            offer: "20% off on all time",
            usage: "2/5",
            infoTitle: "Location",
            infoValue: "Mohakhali, Dhaka",
            isBookmarked: true,
            onCardTap: () {
              Get.to(DiscountDetailsView());
            },
          ),
        ),
      ),
    );
  }
}
