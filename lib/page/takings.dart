import 'package:app/provider/float_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:app/widget/bottom_navigation.dart';
import 'package:app/widget/message_box.dart';
import 'package:app/widget/next_button.dart';
import 'package:app/widget/z_read_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class TakingsPage extends StatefulWidget {
  const TakingsPage({Key? key}) : super(key: key);

  @override
  _TakingsPageState createState() => _TakingsPageState();
}

class _TakingsPageState extends State<TakingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        return updateNoteTakings();
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Bank Takings')),
          body: Column(children: [
            const MessageBox(Text(
                'Confirm you have these amounts for the bank takings.',
                style: TextStyle(color: Colors.black))),
            Container(height: 16),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: const ZReadTable())),
            BottomNavigation(
                text:
                    '\$${context.read<TakingModel>().getTotal.toStringAsFixed(2)}',
                button: const NextButton(destination: '/finalising'))
          ])));

  Future<bool> updateNoteTakings() {
    List<double> notesInFloat = context.read<FloatModel>().getAllNoteCount;
    List<double> notesInTill = context.read<TillModel>().getAllNoteCount;
    List<double> notesInTakings = IterableZip([notesInTill, notesInFloat])
        .map((value) => value[0] - value[1])
        .toList();
    context.read<TakingModel>().subtractNoteCount(notesInTakings);
    return Future.value(true);
  }
}
