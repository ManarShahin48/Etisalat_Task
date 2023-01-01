import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn({
    Key? key,
    required this.onPressed,
    this.text,
    this.fontSize,
    required this.isIcon,
  }) : super(key: key);

  void Function() onPressed;
  String? text;
  double? fontSize;
  bool isIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF9373B9)),
      ),
      onPressed: onPressed,
      child: isIcon
          ? const Icon(Icons.share)
          : Text(
              text!,
              style: TextStyle(fontSize: fontSize),
            ),
    );
  }
}
