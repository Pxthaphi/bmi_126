import 'package:bmi_126/widgets/constants.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final BorderSide? borderSide;
  final double height;
  final double width;
  final Column child;
  const AppCard({
    super.key,
    required this.child,
    this.borderSide,
    this.height = 190,
    this.width = 180,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: borderSide ?? BorderSide.none),
        color: ktranparentColor,
        child: child,
      ),
    );
  }
}
