import 'package:flutter/material.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';

class UVIndexCard extends StatelessWidget {
  const UVIndexCard({
    super.key,
  });

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
           Row(
            children: [
              const Icon(
                Icons.wb_sunny, // Use appropriate icon
                color: Colors.white,
                size: 24.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                'UV INDEX',
                style: AppStyles.styleBold28.copyWith(fontSize: 12,color: const Color(0xffB1AAC3)),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            'uvIndex',
            style: AppStyles.styleSemiBold20,
          ),
          const SizedBox(height: 4.0),
          const Text(
            "description",
            style: AppStyles.styleSemiBold20,
          ),
          const SizedBox(height: 16.0),
           Stack(
            children: [
              Container(
                height: 4.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.purple,
                      Colors.pink,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              Positioned(
                left: 60, // Adjust the left position according to the value
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1.5),
                  ),
                ),
              ),
            ],
          )
        ],

      ),
    );
  }
}
