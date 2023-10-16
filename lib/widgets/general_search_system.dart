import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/pages/food_page/widgets/food_list.dart';
import 'package:eat_easy/pages/table_page/widgets/table_list.dart';
import 'package:eat_easy/widgets/section_header.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/food_model.dart';
import '../../widgets/search_not_found.dart';
import '../models/table_model.dart';
import '../models/tag_model.dart';
import '../pages/search_page/widgets/search_tag.dart';

class GeneralSearchSystem extends StatefulWidget {
  ///Variables
  final Widget childWidget;
  final List<Map<String, dynamic>> foodSearchList;
  final List<Map<String, dynamic>> tableSearchList;
  final String? title;
  final String searchNotFoundText;
  final String searchText;
  final double? searchFieldDist, searchResultDist;

  const GeneralSearchSystem({
    super.key,
    required this.childWidget,
    this.title,
    required this.searchText,
    required this.foodSearchList,
    required this.tableSearchList,
    required this.searchNotFoundText,
    this.searchFieldDist,
    this.searchResultDist,
  });

  @override
  State<GeneralSearchSystem> createState() => _GeneralSearchSystemState();
}

class _GeneralSearchSystemState extends State<GeneralSearchSystem> {
  //Variables
  late final TextEditingController searchTextController;
  FocusNode searchFocusNode //;
      = FocusNode();
  bool showSearchResult = false;

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
    return WillPopScope(
      onWillPop: () async {
        if (!showSearchResult) {
          return true;
        }
        setState(() {
          searchTextController.clear();
          showSearchResult = false;
        });
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width20,
              vertical: widget.searchFieldDist ??
                  AppDimension.getProportionalScreenHeight(48)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title != null
                  ? Column(
                      children: [
                        Text(
                          AppString.search,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: AppDimension.height24,
                                  fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: AppDimension.height20),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: AppDimension.getProportionalScreenHeight(50),
                child: TextFormField(
                  focusNode: searchFocusNode,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {
                    setState(() {
                      showSearchResult = true;
                      widget.foodSearchList.clear();
                      widget.tableSearchList.clear();
                      for (var element in foods) {
                        if (element
                            .toString()
                            .trim()
                            .toLowerCase()
                            .contains(value.trim().toLowerCase())) {
                          widget.foodSearchList.add(element);
                        }
                      }
                      for (var element in tables) {
                        if (element
                            .toString()
                            .trim()
                            .toLowerCase()
                            .contains(value.trim().toLowerCase())) {
                          widget.tableSearchList.add(element);
                        }
                      }
                    });
                  },
                  controller: searchTextController,
                  decoration: InputDecoration(
                    hintText: widget.searchText,
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
              if (showSearchResult)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(text: 'Popular Search'),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        ...List.generate(
                            popularSearchTags.length,
                            (index) => SearchTag(
                                  searchTag:
                                      AppTag(tagText: popularSearchTags[index]),
                                  searchTagList: popularSearchTags,
                                ))
                      ],
                    ),
                    Column(
                      children: [
                        if (widget.foodSearchList.isNotEmpty &&
                            widget.tableSearchList.isNotEmpty) ...[
                          FoodList(foodList: widget.foodSearchList),
                          TableList(tableList: widget.tableSearchList),
                          //FoodSearchResult(foodSearchList: widget.foodSearchList),
                        ] else if (widget.foodSearchList.isNotEmpty &&
                            widget.tableSearchList.isEmpty) ...[
                          FoodList(foodList: widget.foodSearchList)
                        ] else if (widget.foodSearchList.isEmpty &&
                            widget.tableSearchList.isNotEmpty) ...[
                          TableList(tableList: widget.tableSearchList)
                        ] else
                          SearchNotFound(
                              height:
                                  AppDimension.getProportionalScreenHeight(410),
                              actionText: widget.searchNotFoundText)
                      ],
                    ),
                  ],
                )
              else
                widget.childWidget,
            ],
          ),
        ),
      ),
    );
  }
}
