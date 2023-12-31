import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/pages/food_page/widgets/food_list.dart';
import 'package:eat_easy/pages/table_page/widgets/table_list.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/food_model.dart';
import '../../widgets/search_not_found.dart';
import '../models/table_model.dart';

class SearchSystem extends StatefulWidget {
  ///Variables
  final Widget childWidget;
  final List<Map<String, dynamic>> searchList;
  final String? title;
  final String searchNotFoundText;
  final String searchText, searchItem;
  final Widget? searchTags;
  final double? searchFieldDist, searchResultDist;

  const SearchSystem({
    super.key,
    required this.childWidget,
    this.title,
    required this.searchText,
    required this.searchList,
    required this.searchNotFoundText,
    this.searchFieldDist,
    this.searchResultDist,
    required this.searchItem,
    this.searchTags,
  });

  @override
  State<SearchSystem> createState() => _SearchSystemState();
}

class _SearchSystemState extends State<SearchSystem> {
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
                      if (widget.searchItem == 'food') {
                        widget.searchList.clear();
                        for (var element in foods) {
                          if (element
                              .toString()
                              .trim()
                              .toLowerCase()
                              .contains(value.trim().toLowerCase())) {
                            widget.searchList.add(element);
                          }
                        }
                      } else if (widget.searchItem == 'table') {
                        widget.searchList.clear();
                        for (var element in tables) {
                          if (element
                              .toString()
                              .trim()
                              .toLowerCase()
                              .contains(value.trim().toLowerCase())) {
                            widget.searchList.add(element);
                          }
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
              widget.searchTags != null ? widget.searchTags! : Container(),
              if (showSearchResult)
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          widget.searchResultDist ?? AppDimension.height8),
                  child: Column(
                    children: [
                      if (widget.searchItem == 'food') ...[
                        if (widget.searchList.isNotEmpty) ...[
                          FoodList(foodList: widget.searchList),
                          //FoodSearchResult(searchList: widget.searchList),
                        ] else
                          SearchNotFound(actionText: widget.searchNotFoundText)
                      ] else if (widget.searchItem == 'table') ...[
                        if (widget.searchList.isNotEmpty) ...[
                          TableList(tableList: widget.searchList),
                        ] else
                          SearchNotFound(actionText: widget.searchNotFoundText)
                      ]
                    ],
                  ),
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
