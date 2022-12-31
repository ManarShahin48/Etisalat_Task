import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

List<List<dynamic>>? csvData;
List<List<dynamic>>? firstFileData;
List<List<dynamic>>? secondFileData;

Future<List<List<dynamic>>> processCsv(BuildContext context) async {
  var result = await DefaultAssetBundle.of(context).loadString(
    "assets/test_file.csv",
  );
  print(result);
  return const CsvToListConverter().convert(result);
}

Future<List<List<dynamic>>> createFirstFile() async {
  int? ordersNum = csvData?.length;

  Map<String, int> orderNum = {};
  print(csvData);
  for (List<dynamic> val in csvData!) {
    String key = val[2];
    int value = val[3];
    if (orderNum.containsKey(key)) {
      orderNum[key] = value + orderNum[key]!;
    } else {
      orderNum[key] = value;
    }
  }

  List<List<dynamic>> firstData = [];
  List<String> keys = orderNum.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    int? value = orderNum[key];
    firstData.add([key, value! / ordersNum!]);
  }

  Directory dir = await getApplicationDocumentsDirectory();
  File file = File('${dir.path}/firstDataFile.csv');
  String firstDataFile = const ListToCsvConverter().convert(firstData);
  print(firstDataFile);
  await file.writeAsString(firstDataFile);
  return const CsvToListConverter().convert(firstDataFile, eol: "\n");
}

Future<List<List<dynamic>>> createSecondFile() async {
  int? ordersNum = csvData?.length;

  Map<String, List<String>> orderNum = {};
  print(csvData);
  for (List<dynamic> val in csvData!) {
    String key = val[2];
    String value = val[4];
    if (orderNum.containsKey(key)) {
      orderNum[key]?.add(value);
    } else {
      orderNum[key] = [value];
    }
  }
  print(orderNum);

  List<List<dynamic>> secondData = [];
  List<String> keys = orderNum.keys.toList();
  List<List<String>> values = orderNum.values.toList();
  // for (int i = 0; i < keys.length; i++) {
  //   String key = keys[i];
  //   String? value = orderNum[key] as String?;
  //   secondData.add([key, value]);
  // }

  Directory dir = await getApplicationDocumentsDirectory();
  File file = File('${dir.path}/secondDataFile.csv');
  String secondDataFile = const ListToCsvConverter().convert(secondData);
  print(values);
  // print(secondDataFile);
  await file.writeAsString(secondDataFile);
  return const CsvToListConverter().convert(secondDataFile, eol: "\n");
}
