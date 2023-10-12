import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.width6,
                  vertical: AppDimension.height6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary50,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: AppDimension.getProportionalScreenHeight(8),
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ))
      ],
    );
  }
}
