import 'package:eat_easy/widgets/title_2_text.dart';
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
          top: AppDimension.height20, bottom: AppDimension.height16),
      child: Title2Text(text: text),
    );
  }
}
