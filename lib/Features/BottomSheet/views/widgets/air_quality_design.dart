
import 'package:flutter/material.dart';

class AirQualityDesign extends StatelessWidget {
  const AirQualityDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
