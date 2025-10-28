import 'package:flutter/material.dart';
import '../../../../../common/app_text_style/styles.dart';

class CategoryRow extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final MainAxisAlignment alignment;

  const CategoryRow({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.alignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(title, style: titleStyle ?? h5),
        Text(value, style: valueStyle ?? h5),
      ],
    );
  }
}
