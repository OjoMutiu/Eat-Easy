import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';

class SearchTag extends StatelessWidget {
  const SearchTag({
    super.key,
    required this.popularTag,
  });
  final String popularTag;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimension.width8, vertical: AppDimension.height8 / 2),
      margin: EdgeInsets.only(
          right: AppDimension.width16, bottom: AppDimension.height16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimension.height20),
          color: AppColors.tagColorNeutral),
      child: Text(
        popularTag,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: AppDimension.height14,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
