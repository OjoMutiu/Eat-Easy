import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../models/tag_model.dart';

class SearchTag extends StatelessWidget {
  const SearchTag({
    super.key,
    required this.searchTag,
    this.searchTagList,
  });
  final AppTag searchTag;
  final List<String>? searchTagList;
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
        searchTag.tagText,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: AppDimension.getProportionalScreenHeight(13),
              fontWeight: FontWeight.w400,
            ),
      ),
    );

    //   Row(
    //   children: [
    //     , //todo: wrap with gesture detector
    //     //Todo: add the close icon
    //   ],
    // );
  }
}
