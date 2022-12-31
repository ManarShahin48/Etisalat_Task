import 'package:etisalat_task/functions.dart';
import 'package:flutter/material.dart';

class FilesView extends StatelessWidget {
  FilesView({
    Key? key,
    required this.onPressedBtn1,
    required this.onPressedBtn2,
  }) : super(key: key);

  void Function() onPressedBtn1;
  void Function() onPressedBtn2;

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
          ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF9373B9)),
              ),
              onPressed: onPressedBtn1,
              child: const Text('Generate First File',
                  style: TextStyle(fontSize: 14))),
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
          ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF9373B9)),
              ),
              onPressed: onPressedBtn2,
              child: const Text('Generate Second File',
                  style: TextStyle(fontSize: 14))),
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
