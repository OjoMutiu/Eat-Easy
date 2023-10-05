import 'package:eat_easy/constants/app_colors.dart';
import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/models/package_model.dart';
import 'package:eat_easy/pages/search_page/widgets/popular_search_tag.dart';
import 'package:eat_easy/pages/home_page/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/food_model.dart';
import '../../widgets/section_header.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //Variables
  late final TextEditingController searchTextController;
  FocusNode searchFocusNode //;
      = FocusNode();
  bool showContainer = false;
  bool listContain = false;

  List<Map<String, dynamic>> searchList = [];

  List<String> popularSearchTags = const [
    'Duo Table',
    'Noodle',
    'Chicken',
    'Date',
    'Fried rice',
    'Meat',
    'Family'
  ];

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
    searchFocusNode //= FocusNode();
        .addListener(() {
      setState(() {
        //searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimension.width20,
            vertical: AppDimension.getProportionalScreenHeight(48)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.search,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppDimension.height24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: AppDimension.height20),
            ClipRRect(
              child: TextFormField(
                focusNode: searchFocusNode,
                onChanged: (value) {},
                onFieldSubmitted: (value) {
                  searchList.clear();
                  for (var element in foods) {
                    if (element.toString().contains(value)) {
                      setState(() {
                        searchList.add(element);
                      });
                    }
                  }
                },
                controller: searchTextController,
                decoration: InputDecoration(
                  hintText: 'Search food, table, or something',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.neutral,
                        fontSize: AppDimension.height16,
                        fontWeight: FontWeight.w400,
                      ),
                  enabledBorder:
                      Theme.of(context).inputDecorationTheme.enabledBorder,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.neutral,
                  ),
                ),
                onTap: () {
                  setState(() {});
                },
              ),
            ),
            searchFocusNode.hasFocus
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(text: 'Popular Search'),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          ...List.generate(
                              popularSearchTags.length,
                              (index) => SearchTag(
                                  popularTag: popularSearchTags[index]))
                        ],
                      ),
                      SectionHeader(text: 'Recently Search'),
                      Row(
                        children: [
                          ...List.generate(recentlySearched.length, (index) {
                            return PackageCard(
                              image: recentlySearched[index]["image"],
                              package: recentlySearched[index]["package"],
                              description: recentlySearched[index]
                                  ["description"],
                              price: recentlySearched[index]["price"],
                              rating: recentlySearched[index]["rating"],
                            );
                          })
                        ],
                      ),
                    ],
                  )
                : searchList.isEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimension.width20),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/restaurant.svg'),
                              Text(
                                  'Sorry, there is not result for what you are looking for'),
                              ElevatedButton(onPressed: () {}, child: Text(''))
                            ],
                          ),
                        ))
                    : Container(
                        //height: 300,
                        padding: EdgeInsets.symmetric(
                            //horizontal: AppDimension.width16,
                            vertical: AppDimension.height8),
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: searchList.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: (300),
                              child: FooDCard(
                                image: searchList[index]["image"],
                                food: searchList[index]["food"],
                                price: searchList[index]["price"],
                                rating: searchList[index]["rating"],
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppDimension.width16,
                            mainAxisSpacing: AppDimension.height10,
                            childAspectRatio: 1.23 *
                                (AppDimension.screenWidth /
                                    AppDimension.screenHeight),
                          ),
                        ),
                      ),
            if (showContainer)
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                color: Colors.green,
                child: Text('hbghjgjhgv'),
              )
          ],
        ),
      ),
    );
  }
}

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
            // setState(() {
            //   //showContainer = !showContainer;
            // });
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
