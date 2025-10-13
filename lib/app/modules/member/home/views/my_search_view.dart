import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:save_key/common/app_color/app_colors.dart';
import 'package:save_key/common/app_images/app_images.dart';
import 'package:save_key/common/size_box/custom_sizebox.dart';
import 'package:save_key/common/widgets/search_filed.dart';

import '../../../../../common/app_text_style/styles.dart';

class MySearchView extends StatelessWidget {
  const MySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(AppImages.back, scale: 4),
                ),
                sw8,
                Expanded(
                  child: SearchFiled(
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
            sh20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Resent Search', style: h3),
                Text(
                  'Clear all',
                  style: h5.copyWith(color: AppColors.greenNormal),
                ),
              ],
            ),
            sh12,
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: CachedNetworkImageProvider(
                      AppImages.profileImageTwo,
                    ),
                  ),
                  title: Text(
                    'Daily Daawat-Gulshan 1',
                    style: h5,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: CloseButton(
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
