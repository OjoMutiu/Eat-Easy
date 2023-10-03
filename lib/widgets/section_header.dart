import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: AppDimension.height24, bottom: AppDimension.height16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: AppDimension.height20,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
