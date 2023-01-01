import 'package:etisalat_task/functions.dart';
import 'package:etisalat_task/view/components/custom_btn.dart';
import 'package:etisalat_task/view/components/custom_table.dart';
import 'package:flutter/material.dart';

class FilesView extends StatelessWidget {
  FilesView({
    Key? key,
    required this.onPressedBtn1,
    required this.onPressedBtn2,
    required this.sharedBtn1,
    required this.sharedBtn2,
  }) : super(key: key);

  void Function() onPressedBtn1;
  void Function() onPressedBtn2;
  void Function() sharedBtn1;
  void Function() sharedBtn2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTable(
            list: csvData!,
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Area')),
              DataColumn(label: Text('Product Name')),
              DataColumn(label: Text('Quantity')),
              DataColumn(label: Text('Brand ')),
            ],
            columnSpacing: 30,
          ),
          if (firstFileData != null)
            const SizedBox(
              height: 20,
            ),
          if (firstFileData == null && secondFileData == null)
            const SizedBox(
              height: 60,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBtn(
                  onPressed: onPressedBtn1,
                  isIcon: false,
                  fontSize: 14,
                  text: 'Generate First File',
                ),
                CustomBtn(onPressed: sharedBtn1, isIcon: true),
              ],
            ),
          ),
          if (firstFileData != null)
            Column(
              children: [
                CustomTable(
                  list: firstFileData!,
                  columns: const [
                    DataColumn(label: Text('Product Name')),
                    DataColumn(label: Text('Quantity')),
                  ],
                  columnSpacing: 150,
                ),
                if (secondFileData != null)
                  const SizedBox(
                    height: 20,
                  ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBtn(
                  onPressed: onPressedBtn2,
                  isIcon: false,
                  fontSize: 14,
                  text: 'Generate Second File',
                ),
                CustomBtn(onPressed: sharedBtn2, isIcon: true),
              ],
            ),
          ),
          if (secondFileData != null)
            CustomTable(
              list: secondFileData!,
              columns: const [
                DataColumn(label: Text('Product Name')),
                DataColumn(label: Text('Brand')),
              ],
              columnSpacing: 150,
            ),
        ],
      ),
    );
  }
}
