import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Widget content;

  const MessageBox(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: content, padding: const EdgeInsets.all(20)),
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color.fromRGBO(220, 220, 220, 0.7),
      ),
    );
  }
}
