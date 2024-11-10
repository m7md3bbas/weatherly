import 'package:flutter/material.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';

class AirDetailsWidget extends StatelessWidget {
  const AirDetailsWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.widget});
  final String title;
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors
              .transparent, // Background color similar to the one in the widget
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: const Color(0xffB1AAC3), width: 1)),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // AIR QUALITY Text
          Row(
            children: [
              const Icon(Icons.wb_sunny_outlined,
                  color: Color(0xffB1AAC3), size: 18),
              const SizedBox(width: 4),
              Text(
                title,
                style: AppStyles.styleBold28
                    .copyWith(fontSize: 12, color: const Color(0xffB1AAC3)),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // 3-Low Health Risk Text
          Text(
            text,
            style: AppStyles.styleSemiBold20,
          ),
          const SizedBox(height: 18.0),

          widget,
        ],
      ),
    );
  }
}
