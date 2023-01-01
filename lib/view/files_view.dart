import 'package:etisalat_task/functions.dart';
import 'package:etisalat_task/view/custom_btn.dart';
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: DataTable(
              columnSpacing: 30,
              showBottomBorder: true,
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Area')),
                DataColumn(label: Text('Product Name')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Brand ')),
              ],
              rows: csvData!
                  .map(
                    (row) => DataRow(
                      cells: row
                          .map(
                            (csvItem) => DataCell(
                              Text(
                                csvItem.toString(),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 150,
                    showBottomBorder: true,
                    columns: const [
                      DataColumn(label: Text('Product Name')),
                      DataColumn(label: Text('Quantity')),
                    ],
                    rows: firstFileData!
                        .map(
                          (row) => DataRow(
                            cells: row
                                .map(
                                  (csvItem) => DataCell(
                                    Text(
                                      csvItem.toString(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                        .toList(),
                  ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 150,
                showBottomBorder: true,
                columns: const [
                  DataColumn(label: Text('Product Name')),
                  DataColumn(label: Text('Brand ')),
                ],
                rows: secondFileData!
                    .map(
                      (row) => DataRow(
                        cells: row
                            .map(
                              (csvItem) => DataCell(
                                Text(
                                  csvItem.toString(),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
