import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

class QuantityUpdateIcon extends StatelessWidget {
  const QuantityUpdateIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      //Todo: add on Tap function. You can take a name parameter and use it to
      // determine type of icon pressed instead of writing similar function twice
      child: Container(
        height: AppDimension.height24 * 0.9,
        width: AppDimension.width24 * 0.9,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          size: AppDimension.height20 * 0.8,
          color: Colors.white,
        ),
      ),
    );
  }
}
