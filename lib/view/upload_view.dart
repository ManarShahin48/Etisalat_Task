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
          const SizedBox(height: 20,),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF9373B9)),
            ),
            onPressed: onPressed,
            child: const Text(
              'Add File',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
