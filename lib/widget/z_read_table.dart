import 'package:app/provider/taking_provider.dart';
import 'package:app/widget/cell.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ZReadTable extends StatelessWidget {
  const ZReadTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Table(border: TableBorder.all(color: Colors.white), children: [
          tableRow(
              'Denomination',
              'Count',
              const TextStyle(fontWeight: FontWeight.bold),
              Colors.grey.shade700),
          tableRow('\$0.05',
              context.read<TakingModel>().getCoinCount(0).toStringAsFixed(0)),
          tableRow('\$0.10',
              context.read<TakingModel>().getCoinCount(1).toStringAsFixed(0)),
          tableRow('\$0.20',
              context.read<TakingModel>().getCoinCount(2).toStringAsFixed(0)),
          tableRow('\$0.50',
              context.read<TakingModel>().getCoinCount(3).toStringAsFixed(0)),
          tableRow('\$1.00',
              context.read<TakingModel>().getCoinCount(4).toStringAsFixed(0)),
          tableRow('\$2.00',
              context.read<TakingModel>().getCoinCount(5).toStringAsFixed(0)),
          tableRow('\$5.00',
              context.read<TakingModel>().getNoteCount(0).toStringAsFixed(0)),
          tableRow('\$10.00',
              context.read<TakingModel>().getNoteCount(1).toStringAsFixed(0)),
          tableRow('\$20.00',
              context.read<TakingModel>().getNoteCount(2).toStringAsFixed(0)),
          tableRow('\$50.00',
              context.read<TakingModel>().getNoteCount(3).toStringAsFixed(0)),
          tableRow('\$100.00',
              context.read<TakingModel>().getNoteCount(4).toStringAsFixed(0)),
        ]));
  }

  TableRow tableRow(String text1, String text2,
      [TextStyle style = const TextStyle(fontWeight: FontWeight.normal),
      Color backgroundColor = Colors.transparent]) {
    return TableRow(children: [
      Cell(
        text: text1,
        textStyle: style,
        backgroundColor: backgroundColor,
      ),
      Cell(
        text: text2,
        textStyle: style,
        backgroundColor: backgroundColor,
      )
    ]);
  }
}
