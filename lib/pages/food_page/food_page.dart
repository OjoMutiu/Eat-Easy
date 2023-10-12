import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/widgets/search_system.dart';
import 'package:eat_easy/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';

import '../../models/food_model.dart';
import 'widgets/food_card.dart';

class MyFoodPage extends StatefulWidget {
  const MyFoodPage({super.key});

  @override
  State<MyFoodPage> createState() => _MyFoodPageState();
}

class _MyFoodPageState extends State<MyFoodPage> {
  //Variables
  late final FocusNode searchFocusNode;
  late final TextEditingController searchTextController;
  final List<Map<String, dynamic>> foodSearchList = [];

  List<String> foodSearchTagList = [
    'Dinner Food',
    'Economic Food',
    'Hot Food',
    'Family Food',
    'Super Food',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'back',
            );
          },
        ),
        title: Text('Food'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppDimension.height20),
            child: const ShoppingCart(),
          )
        ],
      ),
      body: SearchSystem(
        searchFieldDist: AppDimension.getProportionalScreenHeight(20),
        childWidget: Column(
          children: [
            SizedBox(height: AppDimension.height20),
            GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: AppDimension.getProportionalScreenHeight(300),
                  child: FooDCard(
                    image: foods[index]["image"],
                    food: foods[index]["food"],
                    price: foods[index]["price"],
                    rating: foods[index]["rating"],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppDimension.width16,
                mainAxisSpacing: AppDimension.height10,
                childAspectRatio: 1.23 *
                    (AppDimension.screenWidth / AppDimension.screenHeight),
              ),
            ),
          ],
        ),
        foodSearchList: foodSearchList,
        searchText: 'search food',
        searchNotFoundText: 'Find Other Foods',
      ),
    );
  }
}
/*
SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.width20,
                  vertical: AppDimension.height24),
              child: SizedBox(
                height: AppDimension.getProportionalScreenHeight(50),
                child: TextFormField(
                  focusNode: searchFocusNode,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {
                    searchList.clear();
                    setState(() {
                      showSearchResult = true;
                      for (var element in foods) {
                        if (element
                            .toString()
                            .contains(value.toString().trim())) {
                          print(element.toString());
                          searchList.add(element);
                        }
                      }
                    });
                  },
                  controller: searchTextController,
                  decoration: InputDecoration(
                    hintText: 'searchText',
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
            ),
            Container(
              padding: EdgeInsets.only(left: AppDimension.width20),
              height: AppDimension.height10 * 4.5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodSearchTagList.length,
                  itemBuilder: (context, index) {
                    return SearchTag(
                      searchTag: AppTag(tagText: foodSearchTagList[index]),
                      searchTagList: foodSearchTagList,
                    );
                  }),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.width20,
                  vertical: AppDimension.height20),
              child: Column(
                children: [
                  if (showSearchResult)
                    if (searchList.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: searchList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height:
                                AppDimension.getProportionalScreenHeight(300),
                            child: FooDCard(
                              image: searchList[index]["image"],
                              food: searchList[index]["food"],
                              price: searchList[index]["price"],
                              rating: searchList[index]["rating"],
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppDimension.width16,
                          mainAxisSpacing: AppDimension.height10,
                          childAspectRatio: 1.23 *
                              (AppDimension.screenWidth /
                                  AppDimension.screenHeight),
                        ),
                      )
                    else
                      const SearchNotFound(actionText: 'Find Other Food')
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: AppDimension.getProportionalScreenHeight(300),
                          child: FooDCard(
                            image: foods[index]["image"],
                            food: foods[index]["food"],
                            price: foods[index]["price"],
                            rating: foods[index]["rating"],
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppDimension.width16,
                        mainAxisSpacing: AppDimension.height10,
                        childAspectRatio: 1.23 *
                            (AppDimension.screenWidth /
                                AppDimension.screenHeight),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      )
 */
