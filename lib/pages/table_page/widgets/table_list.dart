import 'package:eat_easy/pages/table_page/widgets/table_card.dart';
import 'package:flutter/material.dart';

class TableList extends StatelessWidget {
  final List<Map<String, dynamic>> tableList;
  const TableList({super.key, required this.tableList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tableList.length,
      itemBuilder: (context, index) {
        return TableCard(
          image: tableList[index]["image"],
          tableType: tableList[index]["tableType"],
          noOfChairs: tableList[index]["noOfChair"],
        );
      },
    );
  }
}
