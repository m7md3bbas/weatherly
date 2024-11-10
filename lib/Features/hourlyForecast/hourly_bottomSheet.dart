import 'package:flutter/material.dart';
import 'package:weatherlyapp/Features/hourlyForecast/widgets/hourlydetails.dart';

Future<void> hourlybottomSheet(BuildContext context) {
  return showModalBottomSheet(
    elevation: 12,
    useSafeArea: true,
    isScrollControlled: true, // Allow full height
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        
        initialChildSize: 0.4, // Start fully expanded
        minChildSize: 0.1, // Minimum height
        maxChildSize: 1.0, // Maximum height to cover full screen
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Color.fromARGB(245, 122, 122, 149)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: const HourlyDetails(
            ),
          );
        },
      );
    },
  );
}
