import 'package:app/main.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Widget content;

  const MessageBox(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(220, 220, 220, 0.7),
      child: Container(child: content, padding: const EdgeInsets.all(20)),
      margin: const EdgeInsets.all(15),
    );
  }
}
