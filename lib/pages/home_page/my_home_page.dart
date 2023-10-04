import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/pages/home_page/widgets/dots.dart';
import 'package:eat_easy/pages/home_page/widgets/main_page_menu_tags.dart';
import 'package:eat_easy/pages/home_page/widgets/page_banner.dart';
import 'package:eat_easy/widgets/section_header.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../models/package_model.dart';
import 'widgets/product_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variables
  late final PageController pageController;
  int _currentPage = 0;

  //Demo data List
  List<Map<String, String>> homePageMenu = [
    {"text": AppString.food, "icon": 'assets/icons/food.svg'},
    {"text": AppString.table, "icon": 'assets/icons/table.svg'},
    {"text": AppString.payment, "icon": 'assets/icons/payment.svg'},
    {"text": AppString.more, "icon": 'assets/icons/more.svg'},
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.9);
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimension.height40),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension.width20,
                vertical: AppDimension.getProportionalScreenHeight(8)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi, Mutiu',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: AppDimension.height24,
                                  fontWeight: FontWeight.w600,
                                )),
                    Text(
                      'Get your favorite food here',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: AppDimension.height16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.shopping_cart)),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontSize: AppDimension
                                          .getProportionalScreenHeight(8),
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: AppDimension.height24),
          PageBanner(pageController: pageController),
          SizedBox(height: AppDimension.height8),
          BuildDot(currentPage: _currentPage),
          Padding(
            padding: EdgeInsets.only(
              left: AppDimension.width20,
              right: AppDimension.width20,
              top: AppDimension.height40 * 0.4,
              bottom: AppDimension.height8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                homePageMenu.length,
                (index) => MainPageMenuTag(
                    icon: homePageMenu[index]["icon"]!,
                    text: homePageMenu[index]["text"]!),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.width20),
            child: const SectionHeader(text: AppString.recommendation),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.width20),
            height: AppDimension.getProportionalScreenHeight(305),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimension.height6),
            ),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: recommendation.length,
                itemBuilder: (context, index) {
                  return PackageCard(
                    image: recommendation[index]["image"],
                    package: recommendation[index]["package"],
                    description: recommendation[index]["description"],
                    price: recommendation[index]["price"],
                    rating: recommendation[index]["rating"],
                  );
                }),
          )
        ],
      ),
    );
  }
}
