import 'package:flutter/cupertino.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';

class BuildDot extends StatelessWidget {
  const BuildDot({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          height: AppDimension.height10,
          width: AppDimension.width10,
          margin: EdgeInsets.symmetric(
              vertical: AppDimension.height8, horizontal: AppDimension.width6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _currentPage == index ? AppColors.primary50 : AppColors.neutral,
          ),
          //duration: const Duration(milliseconds: 100),
        );
      }),
    );
  }
}
