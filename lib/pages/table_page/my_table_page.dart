import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/models/tag_model.dart';
import 'package:eat_easy/pages/search_page/widgets/search_tag.dart';
import 'package:eat_easy/pages/table_page/widgets/table_card.dart';
import 'package:eat_easy/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/table_model.dart';
import '../../widgets/search_not_found.dart';

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
        title: Text('Table'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppDimension.height20),
            child: const ShoppingCart(),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                      for (var element in tables) {
                        if (element.values
                            .toString()
                            .toLowerCase()
                            .contains(value.toString().toLowerCase().trim())) {
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
                  itemCount: tableSearchTagList.length,
                  itemBuilder: (context, index) {
                    return SearchTag(
                      searchTag: AppTag(tagText: tableSearchTagList[index]),
                      searchTagList: tableSearchTagList,
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
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: searchList.length,
                        itemBuilder: (context, index) {
                          return TableCard(
                            image: searchList[index]["image"],
                            tableType: searchList[index]["tableType"],
                            noOfChairs: searchList[index]["noOfChair"],
                          );
                        },
                      )
                    else
                      const SearchNotFound(actionText: 'Find Other Table')
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tables.length,
                      itemBuilder: (context, index) {
                        return TableCard(
                          image: tables[index]["image"],
                          tableType: tables[index]["tableType"],
                          noOfChairs: tables[index]["noOfChair"],
                        );
                      },
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
