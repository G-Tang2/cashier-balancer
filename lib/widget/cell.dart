import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;

  const Cell(
      {required this.text,
      required this.textStyle,
      this.backgroundColor = Colors.transparent,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        color: backgroundColor,
        child: Center(
            child: Text(
          text,
          style: textStyle,
        )));
  }
}
