import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final String text;
  final Widget button;
  final String? subText;

  const BottomNavigation(
      {required this.text, required this.button, this.subText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[800],
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Column(children: [
          subText != null
              ? Container(
                  child: Text(subText!,
                      style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                )
              : Container(),
          Text(
            text,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 10),
          button
        ]));
  }
}
