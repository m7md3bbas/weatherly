import 'package:flutter/material.dart';
import 'package:getx_scaffold/common/index.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textButton, required this.onTap});
final String textButton;
final Function()  onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff0095FF)
        ),
        child:  Center(child: Text(textButton,style: AppStyles.styleRegular20.copyWith(color: const Color(0xffffffff)),)),
      ),
    );
  }
}