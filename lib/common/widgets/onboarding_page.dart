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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sh87,
            Image.asset(
              image,
              scale: 4,
            ),
            sh20,
            Text(
              title,
              style: h2,
              textAlign: TextAlign.center,
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
    );
  }
}
