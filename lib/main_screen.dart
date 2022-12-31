import 'package:etisalat_task/functions.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Etisalat Task"),
      ),
      body: csvData == null
          ? const Center(
        child: Text('Please add your CSV File'),
      )
          : Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: csvData![0]
                  .map(
                    (item) => const DataColumn(
                  label: SizedBox(),
                ),
              )
                  .toList(),
              rows: csvData!
                  .map(
                    (csvrow) => DataRow(
                  cells: csvrow
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: Colors.red)))),
                    onPressed: () async {
                      firstFileData = await createFirstFile();
                      setState(() {});
                    },
                    child: const Text('Generate First File',
                        style: TextStyle(fontSize: 14))),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: Colors.red)))),
                    onPressed: () async {
                      secondFileData = await createSecondFile();
                      setState(() {});
                    },
                    child: const Text('Generate Second File',
                        style: TextStyle(fontSize: 14))),
              ],
            ),
          ),
          firstFileData == null
              ? SizedBox()
              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: firstFileData![0]
                  .map(
                    (item) => const DataColumn(
                  label: SizedBox(),
                ),
              )
                  .toList(),
              rows: firstFileData!
                  .map(
                    (csvrow) => DataRow(
                  cells: csvrow
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload),
        onPressed: () async {
          csvData = await upLoadCSV(context);
          setState(() {});
        },
      ),
    );
  }
}
