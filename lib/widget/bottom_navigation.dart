import 'package:app/main.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final String text;
  final String destination;

  const BottomNavigation(this.text, this.destination, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[800],
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(children: [
          Text(text),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, destination);
              },
              child: const Text('Next'))
        ]));
  }
}
