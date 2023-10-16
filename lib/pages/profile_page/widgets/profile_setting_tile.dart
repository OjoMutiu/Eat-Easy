import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_dimensions.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    super.key,
    this.leadingIcon,
    required this.title,
    this.onPressed,
    required this.isIcon,
    this.leadingIconData,
    this.iconColor,
  });

  final String? leadingIcon;
  final String title;
  final void Function()? onPressed;
  final bool isIcon;
  final IconData? leadingIconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimension.height8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  isIcon
                      ? Icon(
                          leadingIconData!,
                          color: iconColor,
                        )
                      : SvgPicture.asset(leadingIcon!),
                  SizedBox(width: AppDimension.width16),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: AppDimension.height16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              IconButton(
                  onPressed: onPressed,
                  icon: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.width8,
                        vertical: AppDimension.height8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: AppDimension.height16,
                    ),
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.only(
                top: AppDimension.height8, left: AppDimension.width40),
            child: Divider(
              height: AppDimension.getProportionalScreenHeight(0.5),
              thickness: AppDimension.getProportionalScreenHeight(0.5),
              color: const Color(0xFFE9E9E9),
            ),
          )
        ],
      ),
    );
  }
}
