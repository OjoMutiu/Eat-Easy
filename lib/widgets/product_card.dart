import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.productPackage,
    required this.description,
    this.rating,
    required this.price,
  });

  final String image, productPackage, description;
  final double? rating;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: AppDimension.width16),
      width: AppDimension.getProportionalScreenWidth(180),
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppDimension.height6),
                          topRight: Radius.circular(AppDimension.height6),
                        ),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        )),
                    height: 180,
                  ),
                  if (rating != null)
                    rating! > 0
                        ? Positioned(
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppDimension.getProportionalScreenWidth(11),
                                vertical:
                                    AppDimension.getProportionalScreenHeight(3),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.71),
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(AppDimension.height6),
                                    bottomLeft:
                                        Radius.circular(AppDimension.height6),
                                  )),
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Color(0xFFF0C324)),
                                  SizedBox(width: AppDimension.width8 / 2),
                                  Text(
                                    rating.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: AppDimension.height12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  )
                                ],
                              ),
                            ))
                        : Container()
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: AppDimension.height8,
                horizontal: AppDimension.width8),
            width: AppDimension.getProportionalScreenWidth(180),
            decoration: BoxDecoration(
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(3, 3),
                      color: AppColors.neutral.withOpacity(0.1))
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppDimension.height6),
                    bottomLeft: Radius.circular(AppDimension.height6))),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  productPackage,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: AppDimension.height16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: AppDimension.height12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF756F6F),
                      ),
                ),
                Text(
                  '\$${price.toString()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: AppDimension.height14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
