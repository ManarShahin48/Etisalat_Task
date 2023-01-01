import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  CustomTable({
    Key? key,
    required this.list,
    required this.columns,
    required this.columnSpacing,
  }) : super(key: key);

  List<List<dynamic>> list;
  List<DataColumn> columns;
  double columnSpacing;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: columnSpacing,
        showBottomBorder: true,
        columns: columns,
        rows: list
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
    );
  }
}
