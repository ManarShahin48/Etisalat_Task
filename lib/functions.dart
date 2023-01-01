import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pick_or_save/pick_or_save.dart';

List<List<dynamic>>? csvData;
List<List<dynamic>>? firstFileData;
List<List<dynamic>>? secondFileData;

/// First method to add the csv file from the assets.
Future<List<List<dynamic>>> upLoadCSV(BuildContext context) async {
  var result = await DefaultAssetBundle.of(context).loadString(
    "assets/test_file.csv",
  );
  print('The content of the CSV file is: ');
  print(result);
  return const CsvToListConverter().convert(result);
}

/// Generate the first csv file that view in the first column
/// a list of name products and in the second column is
/// the average quantity of the product purchased per order.
Future<List<List<dynamic>>> createFirstFile() async {
  int? ordersNum = csvData?.length;
  Map<String, int> orderNum = {};
  List<List<dynamic>> firstData = [];

  /* create 'orderNum' map to deal with the keys as the product names
     and the values is the count of the orders of every product */
  for (List<dynamic> val in csvData!) {
    String key = val[2];
    int value = val[3];
    if (orderNum.containsKey(key)) {
      orderNum[key] = value + orderNum[key]!;
    } else {
      orderNum[key] = value;
    }
  }

  // to convert the map to List<List<dynamic>> and calculate the average quantity
  List<String> keys = orderNum.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    int? value = orderNum[key];
    firstData.add([key, (value! / ordersNum!).toStringAsFixed(2)]);
  }

  // Generate the first file
  Directory dir = await getApplicationDocumentsDirectory();
  File file = File('${dir.path}/firstDataFile.csv');
  String firstDataFile = const ListToCsvConverter().convert(firstData);
  print('The first file is: ');
  print(firstDataFile);
  await file.writeAsString(firstDataFile);
  List<String>? result = await PickOrSave().fileSaver(
      params: FileSaverParams(
        saveFiles: [
          SaveFileInfo(
              filePath: '${dir.path}/firstDataFile.csv',
              fileName: "firstDataFile.csv")
        ],
      )
  );
  String savedFilePath = result![0];
  print(savedFilePath);
  return const CsvToListConverter().convert(firstDataFile, eol: "\n");
}

/// Generate the second csv file that view in the first column
/// a list of name products and in the second column is
/// the most popular brand of the products.
Future<List<List<dynamic>>> createSecondFile() async {
  Map<String, List<String>> popularBrands = {};
  Map<String, String> popularVal = {};
  List<List<dynamic>> secondData = [];

  //create the popular brands map to collect the different brands for every product.
  for (List<dynamic> val in csvData!) {
    String key = val[2];
    String value = val[4];
    if (popularBrands.containsKey(key)) {
      popularBrands[key]?.add(value);
    } else {
      popularBrands[key] = [value];
    }
  }

  List<String> keys = popularBrands.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    List<String>? value = popularBrands[key];

    // create map of strings as the product name and the values is the number
    // of duplication brands
    Map<String, int> brandsNum = {};
    for (String string in value!) {
      if (brandsNum.containsKey(string)) {
        brandsNum[string] = brandsNum[string]! + 1;
      } else {
        brandsNum[string] = 1;
      }
    }

    // found the most popular brand for every product name
    int? maxVal = 0;
    String newKey = '';
    for (String key in brandsNum.keys) {
      if (brandsNum[key]! > maxVal!) {
        newKey = key;
        maxVal = brandsNum[key];
      }
    }
    popularVal[key] = newKey;
  }

  // to convert the map to List<List<dynamic>>
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    String? value = popularVal[key];
    secondData.add([key, value]);
  }

  // Generate the second file
  Directory dir = await getApplicationDocumentsDirectory();
  File file = File('${dir.path}/secondDataFile.csv');
  String secondDataFile = const ListToCsvConverter().convert(secondData);
  print('The second file is: ');
  print(secondDataFile);
  print(file);
  await file.writeAsString(secondDataFile);
  List<String>? result = await PickOrSave().fileSaver(
      params: FileSaverParams(
        saveFiles: [
          SaveFileInfo(
              filePath: '${dir.path}/secondDataFile.csv',
              fileName: "secondDataFile.csv")
        ],
      )
  );
  String savedFilePath = result![0];
  print(savedFilePath);
  return const CsvToListConverter().convert(secondDataFile, eol: "\n");
}
