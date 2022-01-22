import 'package:app/main.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final String text;
  final Widget button;

  const BottomNavigation(this.text, this.button, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[800],
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Column(children: [
          Text(
            text,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 10),
          button
        ]));
  }
}
