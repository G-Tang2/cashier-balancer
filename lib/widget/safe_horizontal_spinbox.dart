import 'package:app/provider/safe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/provider.dart';

class SafeHorizontalSpinBox extends StatelessWidget {
  final int i;
  final String label;

  const SafeHorizontalSpinBox(this.i, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SpinBox(
          value: context.watch<SafeModel>().get(i),
          decoration: InputDecoration(labelText: label),
          onChanged: (value) => {updateValue(context, value)},
          keyboardType: TextInputType.number,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.fromLTRB(10, 4, 10, 4));
  }

  void updateValue(BuildContext context, double value) {
    context.read<SafeModel>().set(i, value);
  }
}
