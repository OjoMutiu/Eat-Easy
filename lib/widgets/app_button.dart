import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.actionText,
    this.onPressed,
  });

  final String actionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimension.height6)),
      ),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width16,
              vertical: AppDimension.height12),
          child: Center(
            child: Text(
              actionText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: AppDimension.height16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            ),
          )),
    );
  }
}
