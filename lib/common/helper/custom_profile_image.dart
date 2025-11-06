import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:save_key/common/app_color/app_colors.dart';

class CustomProfileImage extends StatelessWidget {
  final String imageUrl;
  final bool isFileImage;
  final double size;
  final Color borderColor;
  final double borderWidth;

  const CustomProfileImage({
    super.key,
    required this.imageUrl,
    this.isFileImage = false,
    this.size = 120,
    this.borderColor = AppColors.greenLight,
    this.borderWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: isFileImage
            ? Image.file(
          File(imageUrl),
          fit: BoxFit.cover,
        )
            : CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(color: AppColors.greenLight),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.person,
            size: 50,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
