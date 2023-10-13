import 'package:flutter/cupertino.dart';

import '../../../constants/app_dimensions.dart';
import 'food_card.dart';

class FoodList extends StatelessWidget {
  final List<Map<String, dynamic>> foodList;
  const FoodList({super.key, required this.foodList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foodList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: AppDimension.getProportionalScreenHeight(300),
          child: FooDCard(
            image: foodList[index]["image"],
            food: foodList[index]["food"],
            price: foodList[index]["price"],
            rating: foodList[index]["rating"],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimension.width16,
        mainAxisSpacing: AppDimension.height10,
        childAspectRatio:
            1.23 * (AppDimension.screenWidth / AppDimension.screenHeight),
      ),
    );
  }
}
