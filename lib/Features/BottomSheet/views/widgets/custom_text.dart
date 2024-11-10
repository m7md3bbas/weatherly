import 'package:flutter/material.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.styleSemiBold20,
    );
  }
}
