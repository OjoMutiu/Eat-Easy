import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/models/package_model.dart';
import 'package:eat_easy/widgets/search_system.dart';
import 'package:eat_easy/pages/search_page/widgets/search_tag.dart';
import 'package:eat_easy/pages/home_page/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../models/tag_model.dart';
import '../../widgets/section_header.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    List<Map<String, dynamic>> foodSearchList = [];
    List<Map<String, dynamic>> tableSearchList = [];

    return SearchSystem(
      title: AppString.search,
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(text: 'Popular Search'),
          Wrap(
            direction: Axis.horizontal,
            children: [
              ...List.generate(
                  popularSearchTags.length,
                  (index) => SearchTag(
                        searchTag: AppTag(tagText: popularSearchTags[index]),
                        searchTagList: popularSearchTags,
                      ))
            ],
          ),
          const SectionHeader(text: 'Recently Search'),
          Row(
            children: [
              ...List.generate(recentlySearched.length, (index) {
                return PackageCard(
                  image: recentlySearched[index]["image"],
                  package: recentlySearched[index]["package"],
                  description: recentlySearched[index]["description"],
                  price: recentlySearched[index]["price"],
                  rating: recentlySearched[index]["rating"],
                );
              })
            ],
          ),
        ],
      ),
      foodSearchList: foodSearchList,
      tableSearchList: tableSearchList,
      searchText: 'Search foods, tables, packages',
      searchNotFoundText: 'Find Others',
    );
  }
}
