import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Widget button;
  final String? text;
  final String? subText;

  const BottomNavigation(
      {required this.button, this.text, this.subText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[800],
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Column(children: [
          if (subText != null)
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                subText!,
                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
              ),
            ),
          if (text != null)
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  text!,
                  style: const TextStyle(fontSize: 32),
                )),
          button
        ]));
  }
}
