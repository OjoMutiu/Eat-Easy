import 'package:eat_easy/constants/app_colors.dart';
import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/pages/home_page/page_banner.dart';
import 'package:eat_easy/pages/home_page/widgets/dots.dart';
import 'package:eat_easy/pages/home_page/widgets/main_page_menu_tags.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variables
  late final PageController pageController;
  int _currentPage = 0;

  List<Map<String, String>> homePageMenu = [
    {"text": 'Food', "icon": 'assets/icons/food.svg'},
    {"text": 'Table', "icon": 'assets/icons/table.svg'},
    {"text": 'Payment', "icon": 'assets/icons/payment.svg'},
    {"text": 'More', "icon": 'assets/icons/more.svg'},
  ];

  List<Map<String, dynamic>> recommendation = [
    {
      "image": "assets/images/recommend1.jpg",
      "rating": "4.7",
      "package": "Family Package",
      "description": "1 large table 6 chairs",
      "price": "260"
    },
    {
      "image": "assets/images/recommend2.jpg",
      "rating": "4.9",
      "package": "Single Breakfast",
      "description": "1 table 1 chairs",
      "price": "50"
    },
    {
      "image": "assets/images/recommend3.jpg",
      "rating": "4.9",
      "package": "Date Package",
      "description": "1 table 2 chairs",
      "price": "99"
    },
    {
      "image": "assets/images/recommend2.jpg",
      "rating": "4.9",
      "package": "Single Breakfast",
      "description": "1 table 1 chairs",
      "price": "50"
    }
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
    return Scaffold(
      body: SingleChildScrollView(
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
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
                top: AppDimension.height40 * 0.6,
                bottom: AppDimension.height40 * 0.8,
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
              child: Text(
                'Recommendation',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: AppDimension.height20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.width20,
                  vertical: AppDimension.height16),
              height: AppDimension.getProportionalScreenHeight(362),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimension.height6),
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendation.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(right: AppDimension.width16),
                      width: AppDimension.getProportionalScreenWidth(180),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              AppDimension.height6),
                                          topRight: Radius.circular(
                                              AppDimension.height6),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              recommendation[index]["image"]),
                                          fit: BoxFit.cover,
                                        )),
                                    height: 180,
                                  ),
                                  Positioned(
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppDimension
                                              .getProportionalScreenWidth(11),
                                          vertical: AppDimension
                                              .getProportionalScreenHeight(3),
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.71),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(
                                                  AppDimension.height6),
                                              bottomLeft: Radius.circular(
                                                  AppDimension.height6),
                                            )),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Color(0xFFF0C324)),
                                            SizedBox(
                                                width: AppDimension.width8 / 2),
                                            Text(
                                              recommendation[index]["rating"],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize:
                                                        AppDimension.height12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            )
                                          ],
                                        ),
                                      ))
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
                                    bottomRight:
                                        Radius.circular(AppDimension.height6),
                                    bottomLeft:
                                        Radius.circular(AppDimension.height6))),
                            child: Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  recommendation[index]["package"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: AppDimension.height16,
                                          fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  recommendation[index]["description"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: AppDimension.height12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF756F6F),
                                      ),
                                ),
                                Text(
                                  '\$${recommendation[index]["price"]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: AppDimension.height14,
                                          fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
