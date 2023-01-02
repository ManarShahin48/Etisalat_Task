import 'package:etisalat_task/functions.dart';
import 'package:etisalat_task/view/components/custom_btn.dart';
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF9373B9).withOpacity(0.1),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Quantity'),
                      SizedBox(
                        width: 60,
                      ),
                      Text('Brand'),
                    ],
                  ),
                  leading: const Text('ID'),
                  title: Row(
                    children: const [
                      Text('Area'),
                      SizedBox(width: 70),
                      Text('Product'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 5,
                  ),
                  itemCount: csvData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<dynamic> row = csvData![index];
                    return Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9373B9).withOpacity(0.1),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: ListTile(
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(row[3].toString()),
                            const SizedBox(
                              width: 60,
                            ),
                            Text(row[4].toString()),
                          ],
                        ),
                        leading: Text(row[0].toString()),
                        title: Row(
                          children: [
                            Text(row[1].toString()),
                            const SizedBox(width: 55),
                            Text(row[2].toString()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
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
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF9373B9).withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text('Product'),
                                    Text('Quantity')
                                  ]),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 5,
                                ),
                                itemCount: firstFileData!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  List<dynamic> row = firstFileData![index];
                                  return Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF9373B9)
                                          .withOpacity(0.1),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(row[0].toString()),
                                          Text(row[1].toString())
                                        ]),
                                  );
                                },
                              ),
                            ),
                            if (secondFileData != null)
                              const SizedBox(
                                height: 10,
                              ),
                          ],
                        ),
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
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF9373B9).withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text('Product'),
                                    Text('Brand')
                                  ]),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 5,
                                ),
                                itemCount: secondFileData!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  List<dynamic> row = secondFileData![index];
                                  return Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF9373B9)
                                          .withOpacity(0.1),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(row[0].toString()),
                                          Text(row[1].toString())
                                        ]),
                                  );
                                },
                              ),
                            ),
                            if (secondFileData != null)
                              const SizedBox(
                                height: 10,
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
