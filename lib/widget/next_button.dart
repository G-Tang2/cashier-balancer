import 'package:app/main.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String destination;

  const NextButton(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, destination);
        },
        child: const Text('Next'));
  }
}
