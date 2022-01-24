import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String destination;
  final VoidCallback?
      callback; // function that will be called when button is pressed
  final bool condition; // condition check that enables or disables button

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
                    callback?.call();
                    Navigator.pushNamed(context, destination);
                  }
                : null,
            child: const Text('Next')));
  }
}
