import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/models/tag_model.dart';
import 'package:eat_easy/pages/search_page/widgets/search_tag.dart';
import 'package:eat_easy/pages/table_page/widgets/table_list.dart';
import 'package:eat_easy/widgets/search_system.dart';
import 'package:eat_easy/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';

import '../../models/table_model.dart';

class MyTablePage extends StatefulWidget {
  const MyTablePage({super.key});

  @override
  State<MyTablePage> createState() => _MyTablePageState();
}

class _MyTablePageState extends State<MyTablePage> {
  //Variables
  late final FocusNode searchFocusNode;
  late final TextEditingController searchTextController;
  bool showSearchResult = false;
  final List<Map<String, dynamic>> searchList = [];

  List<String> tableSearchTagList = [
    'Dinner Food',
    'Economic Food',
    'Hot Food',
    'Family Food',
    'Super Food',
  ];

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
    searchTextController = TextEditingController();
  }

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
        title: const Text('Table'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppDimension.height20),
            child: const ShoppingCart(),
          )
        ],
      ),
      body: SearchSystem(
        childWidget: Container(
            margin: EdgeInsets.only(top: AppDimension.height24),
            child: TableList(tableList: tables)),
        searchText: 'search tables',
        searchList: searchList,
        searchNotFoundText: 'Find Other Tables',
        searchItem: 'table',
        searchTags: Container(
          margin: EdgeInsets.only(top: AppDimension.height24),
          height: AppDimension.height10 * 4.5,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tableSearchTagList.length,
              itemBuilder: (context, index) {
                return SearchTag(
                  searchTag: AppTag(tagText: tableSearchTagList[index]),
                  searchTagList: tableSearchTagList,
                );
              }),
        ),
        searchFieldDist: AppDimension.height24,
        searchResultDist: AppDimension.height20,
      ),
    );
  }
}
