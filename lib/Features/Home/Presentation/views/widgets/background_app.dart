import 'package:flutter/material.dart';

class BackgroundApp extends StatelessWidget {
  final Widget child;

  const BackgroundApp({super.key, required this.child, required this.image,this.width});
  final String image;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
        child: child,
      ),
    );
  }
}
