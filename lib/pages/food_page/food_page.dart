import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/pages/food_page/widgets/food_list.dart';
import 'package:eat_easy/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';

import '../../models/food_model.dart';
import '../../models/tag_model.dart';
import '../../widgets/search_system.dart';
import '../search_page/widgets/search_tag.dart';

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
        searchFieldDist: AppDimension.height24,
        searchResultDist: AppDimension.height20,
        childWidget: Container(
          margin: EdgeInsets.only(top: AppDimension.height24),
          child: FoodList(foodList: foods),
        ),
        searchList: foodSearchList,
        searchText: 'search food',
        searchNotFoundText: 'Find Other Foods',
        searchItem: 'food',
        searchTags: Container(
          margin: EdgeInsets.only(top: AppDimension.height24),
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
      ),
    );
  }
}
