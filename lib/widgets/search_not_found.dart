import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_dimensions.dart';
import 'app_button.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({
    super.key,
    required this.actionText,
  });

  final String actionText;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppDimension.getProportionalScreenHeight(600),
        padding: EdgeInsets.symmetric(horizontal: AppDimension.width20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/restaurant.svg'),
            SizedBox(height: AppDimension.height24),
            Text(
              'Sorry, there is not result for what you are looking for :( ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppDimension.height24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: AppDimension.height24 * 2),
            AppButton(
                actionText:
                    actionText) //TODO: Pass onTop function as ann argument
          ],
        ));
  }
}
