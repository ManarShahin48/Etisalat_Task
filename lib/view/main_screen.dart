import 'package:etisalat_task/functions.dart';
import 'package:etisalat_task/view/files_view.dart';
import 'package:etisalat_task/view/upload_view.dart';
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
        title: const Text("Etisalat Task",
            style: TextStyle(
              fontSize: 25,
            )),
        backgroundColor: const Color(0xFF9373B9),
      ),
      body: csvData == null
          ? UploadView(
              onPressed: () async {
                csvData = await upLoadCSV(context);
                setState(() {});
              },
            )
          : FilesView(onPressedBtn1: () async {
              firstFileData = await createFirstFile();
              setState(() {});
            }, onPressedBtn2: () async {
              secondFileData = await createSecondFile();
              setState(() {});
            }),
    );
  }
}
