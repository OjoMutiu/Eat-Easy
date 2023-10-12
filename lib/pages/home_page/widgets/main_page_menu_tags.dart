import 'package:eat_easy/pages/food_page/food_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_dimensions.dart';
import '../../table_page/my_table_page.dart';

class MainPageMenuTag extends StatelessWidget {
  const MainPageMenuTag({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
  });
  final String icon, text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyFoodPage();
            }));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyTablePage();
            }));
            break;
          case 2:
            print('Hello 2');
            break;
          case 3:
            print('Hello 3');
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: AppDimension.getProportionalScreenWidth(7),
          right: AppDimension.getProportionalScreenWidth(7),
          bottom: AppDimension.getProportionalScreenHeight(7),
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.width12,
                    vertical: AppDimension.height12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: AppDimension.getProportionalScreenWidth(1),
                      color: const Color(0xFFF4F0F0),
                    )),
                child: SvgPicture.asset(
                  icon,
                  height: AppDimension.height24,
                  width: AppDimension.width24,
                )),
            SizedBox(height: AppDimension.height8 / 2),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: AppDimension.height16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
