import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/size_box/custom_sizebox.dart';
import '../app_text_style/styles.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              scale: 4,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 100.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: h2,
                  ),
                  sh8,
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: h5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
