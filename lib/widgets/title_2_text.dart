import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

class Title2Text extends StatelessWidget {
  const Title2Text({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: AppDimension.height20,
          fontWeight: FontWeight.w600,
          color: color ?? color),
    );
  }
}
