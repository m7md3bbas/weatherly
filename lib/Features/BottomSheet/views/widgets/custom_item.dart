import 'package:flutter/material.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';

class CustomItem extends StatelessWidget {
  const CustomItem(
      {super.key, required this.temp, required this.icon, required this.time});
  final num temp;
  final String icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(right: 12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              time,
              style: AppStyles.styleRegular13,
            ),
            Image.asset(
              icon,
              height: 32,
              width: 32,
            ),
            Text(
              "$temp",
              style: AppStyles.styleRegular17,
            ),
          ],
        ),
      ),
    );
  }
}
