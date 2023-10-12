import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/food_model.dart';
import '../../widgets/search_not_found.dart';
import '../models/table_model.dart';
import '../pages/food_page/widgets/food_card.dart';
import '../pages/table_page/widgets/table_card.dart';

class SearchSystem extends StatefulWidget {
  ///Variables
  final Widget childWidget;
  final List<Map<String, dynamic>>? foodSearchList;
  final List<Map<String, dynamic>>? tableSearchList;
  final String? title;
  final String searchNotFoundText;
  final String searchText;
  final Widget? foodCard, tableCard;
  final double? searchFieldDist, searchResultDist;

  const SearchSystem({
    super.key,
    required this.childWidget,
    this.title,
    required this.searchText,
    this.foodCard,
    this.tableCard,
    this.foodSearchList,
    this.tableSearchList,
    required this.searchNotFoundText,
    this.searchFieldDist,
    this.searchResultDist,
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
                      if (widget.tableSearchList != null ||
                          widget.foodSearchList != null) {
                        if (widget.foodSearchList != null) {
                          widget.foodSearchList!.clear();
                          for (var element in foods) {
                            if (element
                                .toString()
                                .trim()
                                .toLowerCase()
                                .contains(value.trim().toLowerCase())) {
                              widget.foodSearchList!.add(element);
                            }
                          }
                        }
                        if (widget.tableSearchList != null) {
                          widget.tableSearchList!.clear();
                          for (var element in tables) {
                            if (element
                                .toString()
                                .trim()
                                .toLowerCase()
                                .contains(value.trim().toLowerCase())) {
                              widget.tableSearchList!.add(element);
                            }
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
              if (showSearchResult)
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          widget.searchResultDist ?? AppDimension.height8),
                  child: Column(
                    children: [
                      if (widget.foodSearchList != null &&
                          widget.foodSearchList!.isNotEmpty) ...[
                        buildFoodResult(),
                      ],
                      if (widget.tableSearchList != null &&
                          widget.tableSearchList!.isNotEmpty) ...[
                        buildTableResult(),
                      ],
                      if (widget.tableSearchList == null ||
                          widget.foodSearchList == null) ...[
                        if (widget.tableSearchList == null &&
                            widget.foodSearchList!.isNotEmpty)
                          Container()
                        else if (widget.foodSearchList == null &&
                            widget.tableSearchList!.isNotEmpty)
                          Container()
                        else
                          SearchNotFound(actionText: widget.searchNotFoundText),
                      ]

                      // else
                      //   SearchNotFound(actionText: widget.searchNotFoundText)
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

  ListView buildTableResult() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.tableSearchList!.length,
      itemBuilder: (context, index) {
        return TableCard(
          image: widget.tableSearchList![index]["image"],
          tableType: widget.tableSearchList![index]["tableType"],
          noOfChairs: widget.tableSearchList![index]["noOfChair"],
        );
      },
    );
  }

  GridView buildFoodResult() {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.foodSearchList!.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: AppDimension.getProportionalScreenHeight(300),
          child: FooDCard(
            image: widget.foodSearchList![index]["image"],
            food: widget.foodSearchList![index]["food"],
            price: widget.foodSearchList![index]["price"],
            rating: widget.foodSearchList![index]["rating"],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimension.width16,
        mainAxisSpacing: AppDimension.height10,
        childAspectRatio:
            1.23 * (AppDimension.screenWidth / AppDimension.screenHeight),
      ),
    );
  }
}
