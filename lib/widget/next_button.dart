import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String destination;
  final VoidCallback? callback;
  final bool condition;

  const NextButton(
      {required this.destination,
      this.callback,
      this.condition = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ElevatedButton(
            onPressed: condition
                ? () {
                    Navigator.pushNamed(context, destination);
                  }
                : null,
            child: const Text('Next')));
  }
}
