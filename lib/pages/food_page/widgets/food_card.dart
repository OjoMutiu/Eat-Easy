import 'package:eat_easy/widgets/app_button.dart';
import 'package:eat_easy/widgets/quantity_update_icon.dart';
import 'package:eat_easy/widgets/title_1_text.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';

class FooDCard extends StatelessWidget {
  const FooDCard({
    super.key,
    required this.food,
    required this.image,
    this.rating,
    required this.price,
  });

  final String food, image;
  final double? rating;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: AppDimension.getProportionalScreenHeight(560),
                    decoration: BoxDecoration(
                      color: AppColors.tagColorNeutral,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppDimension.height24),
                          topLeft: Radius.circular(AppDimension.height24)),
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppDimension.getProportionalScreenHeight(300),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(AppDimension.height24),
                                  topLeft:
                                      Radius.circular(AppDimension.height24)),
                              image: DecorationImage(
                                  image: AssetImage(image), fit: BoxFit.cover)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimension.width20,
                              vertical: AppDimension.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Title1Text(text: food),
                                      SizedBox(height: AppDimension.height8),
                                      Row(
                                        children: [
                                          ...List.generate(5, (index) {
                                            return Icon(Icons.star,
                                                color:
                                                    AppColors.iconColorYellow);
                                          }),
                                          SizedBox(width: AppDimension.width8),
                                          Text(
                                            rating.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: AppColors.neutral,
                                                  fontSize:
                                                      AppDimension.height16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      QuantityUpdateIcon(
                                        icon: Icons.remove,
                                        color: AppColors.neutral,
                                      ),
                                      SizedBox(width: AppDimension.width16),
                                      Text(
                                        '1',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontSize: AppDimension.height16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      SizedBox(width: AppDimension.width16),
                                      QuantityUpdateIcon(
                                          icon: Icons.add,
                                          color: AppColors.primary50),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: AppDimension.height24),
                              Title1Text(text: "\$$price"),
                              SizedBox(height: AppDimension.height32),
                              AppButton(
                                actionText: 'Place Order',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: SizedBox(
            height: AppDimension.getProportionalScreenHeight(180),
            width: AppDimension.getProportionalScreenWidth(180),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimension.height6),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Container(
          width: AppDimension.getProportionalScreenWidth(180),
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width8, vertical: AppDimension.height8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimension.height6),
                  bottomRight: Radius.circular(AppDimension.height6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(3, 3),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(food),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.iconColorYellow),
                  SizedBox(width: AppDimension.width8 / 2),
                  Text(rating.toString())
                ],
              ),
              Text('\$${price.toString()}')
            ],
          ),
        )
      ],
    );
  }
}
