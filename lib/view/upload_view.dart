import 'package:etisalat_task/view/custom_btn.dart';
import 'package:flutter/material.dart';

class UploadView extends StatelessWidget {
  UploadView({Key? key, required this.onPressed}) : super(key: key);

  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Please add your CSV File',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomBtn(
            onPressed: onPressed,
            isIcon: false,
            fontSize: 18,
            text: 'Add File',
          ),
        ],
      ),
    );
  }
}
