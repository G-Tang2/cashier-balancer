import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class CashSpinBox extends StatelessWidget {
  final int i;
  final String label;
  final double Function(int) value;
  final void Function(int, double) callback;

  const CashSpinBox(this.i, this.label, this.value, this.callback, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinBox(
        value: value(i),
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
        onChanged: (value) => callback(i, value),
        keyboardType: TextInputType.number,
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
  }

  // void updateValue(BuildContext context, double value) {
  //   if (type == CashType.coin) {
  //     context.read<FloatModel>().setCoinCount(i, value);
  //   } else {
  //     context.read<FloatModel>().setNoteCount(i, value);
  //   }
  // }
}
