import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

class Title1Text extends StatelessWidget {
  const Title1Text({
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
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: AppDimension.height24,
          fontWeight: FontWeight.w600,
          color: color ?? color),
    );
  }
}
