import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';

class TableCard extends StatelessWidget {
  const TableCard({
    super.key,
    required this.image,
    required this.tableType,
    required this.noOfChairs,
  });

  final String image, tableType;
  final int noOfChairs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.getProportionalScreenHeight(260),
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimension.height24),
        decoration: BoxDecoration(
            color: AppColors.secondary10,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(AppDimension.height6)),
        child: Stack(
          children: [
            Positioned(
              top: AppDimension.getProportionalScreenHeight(170),
              left: AppDimension.width16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tableType,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: AppDimension.height24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    '1 table $noOfChairs chair',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: AppDimension.height16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
