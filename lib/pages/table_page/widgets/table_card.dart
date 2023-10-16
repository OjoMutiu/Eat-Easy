import 'package:eat_easy/models/tag_model.dart';
import 'package:eat_easy/pages/search_page/widgets/search_tag.dart';
import 'package:eat_easy/widgets/app_button.dart';
import 'package:eat_easy/widgets/title_2_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';

class TableCard extends StatefulWidget {
  const TableCard({
    super.key,
    required this.image,
    required this.tableType,
    required this.noOfChairs,
  });

  final String image, tableType;
  final int noOfChairs;

  @override
  State<TableCard> createState() => _TableCardState();
}

List<int> time = [10, 30, 45, 60, 120];
bool _addChair = false;
bool _addTable = false;
bool _addFlower = false;

class _TableCardState extends State<TableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            builder: (context) {
              return TableBottomModalSheet();
            });
      },
      child: SizedBox(
        height: AppDimension.getProportionalScreenHeight(260),
        child: Container(
          margin: EdgeInsets.only(bottom: AppDimension.height24),
          decoration: BoxDecoration(
              color: AppColors.secondary10,
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(AppDimension.height6)),
          child: Stack(
            children: [
              Positioned(
                top: AppDimension.getProportionalScreenHeight(170),
                left: AppDimension.width16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tableType,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: AppDimension.height24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      '1 table ${widget.noOfChairs} chair',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: AppDimension.height16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AdditionalOrder extends StatelessWidget {
  const AdditionalOrder({
    super.key,
    required this.addOrder,
    required this.text,
    required this.onChanged,
    required this.additionalOrder,
  });

  final bool addOrder;
  final String text, additionalOrder;
  final void Function(bool? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          //color: Colors.red,
          width: AppDimension.height40 * 5,
          child: MediaQuery.removePadding(
            context: context,
            removeLeft: true,
            removeTop: true,
            child: CheckboxListTile(
                activeColor: AppColors.primary50,
                //checkColor: AppColors.primary50,
                title: Text(
                  additionalOrder,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppDimension.height16,
                      fontWeight: FontWeight.w400),
                ),
                value: addOrder,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: onChanged),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: AppDimension.width20),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: AppDimension.height16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class TableBottomModalSheet extends StatefulWidget {
  const TableBottomModalSheet({super.key});

  @override
  State<TableBottomModalSheet> createState() => _TableBottomModalSheetState();
}

class _TableBottomModalSheetState extends State<TableBottomModalSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.getProportionalScreenHeight(700),
      child: Column(
        children: [
          Container(
            width: AppDimension.width20 * 2,
            height: AppDimension.height8 / 2,
            margin: EdgeInsets.only(top: AppDimension.height16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimension.height8 / 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimension.height8 / 2),
              child: Divider(
                thickness: AppDimension.height8 / 2,
                color: AppColors.neutral,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension.width20,
                vertical: AppDimension.height16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title2Text(text: 'Time'),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: AppDimension.height12),
                  height: AppDimension.height40 * 2,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: time.length,
                        itemBuilder: (context, index) {
                          return SearchTag(
                              searchTag: AppTag(
                                  tagText: time[index] < 60
                                      ? '${time[index].toString()} minutes'
                                      : '${(time[index] / 60).floor().toString()} hour'));
                        }),
                  ),
                ),
                //SizedBox(height: AppDimension.height24),
                Title2Text(text: 'Additional'),
              ],
            ),
          ),
          Column(
            children: [
              AdditionalOrder(
                addOrder: _addChair,
                text: 'Free',
                onChanged: (bool? value) {
                  setState(() {
                    _addChair = value!;
                  });
                },
                additionalOrder: 'Chair',
              ),
              AdditionalOrder(
                addOrder: _addTable,
                text: 'Free',
                onChanged: (bool? value) {
                  setState(() {
                    _addTable = value!;
                  });
                },
                additionalOrder: 'Table',
              ),
              AdditionalOrder(
                addOrder: _addFlower,
                text: '\$ 25',
                onChanged: (bool? value) {
                  setState(() {
                    _addFlower = value!;
                  });
                },
                additionalOrder: 'Flower',
              ),
              SizedBox(height: AppDimension.height24),
            ],
          ),
          const Spacer(flex: 2),
          Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.width20),
              child: AppButton(
                actionText: 'Book Table',
                onPressed: () {
                  //todo: complete the onpressed
                },
              )),
          const Spacer(flex: 1)
        ],
      ),
    );
  }
}
