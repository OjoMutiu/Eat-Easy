import 'package:eat_easy/constants/app_colors.dart';
import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/pages/profile_page/widgets/profile_setting_tile.dart';
import 'package:eat_easy/widgets/app_button.dart';
import 'package:eat_easy/widgets/title_1_text.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    String emailAddress = 'sourcecode.wildtech@gmail.com';
    String emailAddressSubString1 = emailAddress.substring(0, 20);
    String emailAddressSubString2 =
        emailAddress.substring(20, emailAddress.length);
    // IconData showMoreIcon = Icons.keyboard_arrow_down;

    List<Map<String, dynamic>> accountProfileTile = [
      {
        "leadingIcon": 'assets/icons/payment.svg',
        "title": 'Payment Method',
        "isIcon": false,
        "onPressed": () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Payment Selected'),
                );
              });
        }
      },
      {
        "title": 'My Cart',
        "isIcon": true,
        "leadingIconData": Icons.shopping_cart,
        "iconColor": AppColors.primary50,
        "onPressed": () {}
      },
      {
        "title": 'Help & Report',
        "isIcon": true,
        "leadingIconData": Icons.help,
        "iconColor": AppColors.accent50,
        "onPressed": () {}
      },
      {
        "title": 'Language',
        "isIcon": true,
        "leadingIconData": Icons.translate,
        "onPressed": () {}
      },
      {
        "title": 'Notification',
        "isIcon": true,
        "leadingIconData": Icons.notifications,
        "iconColor": AppColors.primary50,
        "onPressed": () {}
      },
    ];
    List<Map<String, dynamic>> moreInfoProfileTile = [
      {
        "title": 'Privacy Policy',
        "isIcon": true,
        "leadingIconData": Icons.privacy_tip,
        "iconColor": AppColors.accent50,
        "onPressed": () {}
      },
      {
        "title": 'News & Services',
        "isIcon": true,
        "leadingIconData": Icons.my_library_books_rounded,
        "iconColor": AppColors.secondary30,
        "onPressed": () {}
      },
      {
        "title": 'Give Rating',
        "isIcon": true,
        "leadingIconData": Icons.star,
        "iconColor": AppColors.iconColorYellow,
        "onPressed": () {}
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width20,
              vertical: AppDimension.height16 * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title1Text(text: 'Profile'),
              SizedBox(height: AppDimension.height24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: AppDimension.height40 * 2,
                        width: AppDimension.width40 * 2,
                        decoration: BoxDecoration(
                          color: AppColors.primary30,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_image.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: AppDimension.width16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mutiu Ojo',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontSize: AppDimension.height20,
                                    fontWeight: FontWeight.w500),
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text(
                                emailAddressSubString1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: AppDimension.height14,
                                        fontWeight: FontWeight.w400),
                              ),
                              emailAddress.length > AppDimension.width20
                                  ? Text(emailAddressSubString2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontSize: AppDimension.height14,
                                              fontWeight: FontWeight.w400))
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: AppDimension.width16),
                          SizedBox(width: AppDimension.width8),
                          Text('Edit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: AppDimension.height14,
                                      fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: AppDimension.height40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppDimension.height16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: AppDimension.height16),
                  ...List.generate(accountProfileTile.length, (index) {
                    return ProfileSettings(
                      leadingIcon: accountProfileTile[index]["leadingIcon"],
                      title: accountProfileTile[index]["title"],
                      onPressed: accountProfileTile[index]["onPressed"],
                      isIcon: accountProfileTile[index]["isIcon"],
                      leadingIconData: accountProfileTile[index]
                          ["leadingIconData"],
                      iconColor: accountProfileTile[index]["iconColor"],
                    );
                  }),
                  Container(
                    padding: EdgeInsets.only(
                        top: AppDimension.height24,
                        bottom: AppDimension.height16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'More Info',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: AppDimension.height16,
                                  fontWeight: FontWeight.w400),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                showMore = !showMore;
                              });
                            },
                            icon: Icon(showMore
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down))
                      ],
                    ),
                  ),
                  showMore
                      ? Column(
                          children: [
                            ...List.generate(moreInfoProfileTile.length,
                                (index) {
                              return ProfileSettings(
                                leadingIcon: moreInfoProfileTile[index]
                                    ["leadingIcon"],
                                title: moreInfoProfileTile[index]["title"],
                                onPressed: moreInfoProfileTile[index]
                                    ["onPressed"],
                                isIcon: moreInfoProfileTile[index]["isIcon"],
                                leadingIconData: moreInfoProfileTile[index]
                                    ["leadingIconData"],
                                iconColor: moreInfoProfileTile[index]
                                    ["iconColor"],
                              );
                            })
                          ],
                        )
                      : Container(),
                  SizedBox(height: AppDimension.height20),
                  const AppButton(actionText: 'Logout'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
