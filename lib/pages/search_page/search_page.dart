import 'package:eat_easy/constants/app_colors.dart';
import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/models/product_model.dart';
import 'package:eat_easy/pages/search_page/widgets/popular_search_tag.dart';
import 'package:eat_easy/widgets/product_card.dart';
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

  List<Widget> popularSearchTags = const [
    SearchTag(popularTag: 'Duo Table'),
    SearchTag(popularTag: 'Noodle'),
    SearchTag(popularTag: 'Chicken'),
    SearchTag(popularTag: 'Date'),
    SearchTag(popularTag: 'Fried rice'),
    SearchTag(popularTag: 'Meat'),
    SearchTag(popularTag: 'Family'),
  ];

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  prefixIcon: IconButton(
                    onPressed: () {
                      //TODO: probably set focus node
                    },
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.neutral,
                    ),
                  )),
            ),
          ),
          SectionHeader(text: 'Popular Search'),
          Wrap(
            direction: Axis.horizontal,
            children: [
              ...List.generate(
                  popularSearchTags.length, (index) => popularSearchTags[index])
            ],
          ),
          SectionHeader(text: 'Recently Search'),
          Row(
            children: [
              ...List.generate(recentlySearched.length, (index) {
                return ProductCard(
                  image: recentlySearched[index]["image"],
                  productPackage: recentlySearched[index]["package"],
                  description: recentlySearched[index]["description"],
                  price: recentlySearched[index]["price"],
                  rating: recentlySearched[index]["rating"],
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
