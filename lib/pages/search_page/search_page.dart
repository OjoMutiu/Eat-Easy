import 'package:eat_easy/constants/app_colors.dart';
import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/models/package_model.dart';
import 'package:eat_easy/pages/search_page/widgets/popular_search_tag.dart';
import 'package:eat_easy/pages/home_page/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../widgets/section_header.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //Variables
  late final TextEditingController searchTextController;
  late FocusNode searchFocusNode;

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
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          return true;
        }
        return false;
      },
      child: SingleChildScrollView(
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
                    fontSize: AppDimension.height24,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: AppDimension.height20),
              ClipRRect(
                child: TextFormField(
                  focusNode: searchFocusNode,
                  controller: searchTextController,
                  decoration: InputDecoration(
                      hintText: 'Search food, table, or something',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.neutral,
                                fontSize: AppDimension.height16,
                                fontWeight: FontWeight.w400,
                              ),
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      prefixIcon: IconButton(
                        onPressed: () {
                          //TODO: probably set focus node
                        },
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.neutral,
                        ),
                      )),
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
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimension.width16,
                          vertical: AppDimension.height16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height:
                                  AppDimension.getProportionalScreenHeight(180),
                              width:
                                  AppDimension.getProportionalScreenWidth(180),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    'assets/images/meatball.jpg',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Container(
                            width: AppDimension.getProportionalScreenWidth(180),
                            padding: EdgeInsets.symmetric(
                                horizontal: AppDimension.width8,
                                vertical: AppDimension.height8),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(3, 3),
                              )
                            ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Meatball Sweetie'),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: AppColors.iconColorYellow),
                                    SizedBox(width: AppDimension.width8 / 2),
                                    Text('4.9')
                                  ],
                                ),
                                Text('\$63.5')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
