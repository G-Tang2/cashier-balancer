import 'package:app/provider/float_provider.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:app/widget/bottom_navigation.dart';
import 'package:app/widget/cash_spinbox.dart';
import 'package:app/widget/message_box.dart';
import 'package:app/widget/next_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class NoteFloatPage extends StatefulWidget {
  const NoteFloatPage({Key? key}) : super(key: key);

  @override
  _NotenFloatPageState createState() => _NotenFloatPageState();
}

class _NotenFloatPageState extends State<NoteFloatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        return updateCoinFloat();
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Note Float')),
          body: Column(children: [
            Expanded(
                child: Scrollbar(
                    child: ListView(children: [
              makeInstructionText(),
              CashSpinBox(
                0,
                '\$5.00',
                context.watch<FloatModel>().getNoteCount,
                context.read<FloatModel>().setNoteCount,
              ),
              CashSpinBox(
                1,
                '\$10.00',
                context.watch<FloatModel>().getNoteCount,
                context.read<FloatModel>().setNoteCount,
              ),
              CashSpinBox(
                2,
                '\$20.00',
                context.watch<FloatModel>().getNoteCount,
                context.read<FloatModel>().setNoteCount,
              ),
              CashSpinBox(
                3,
                '\$50.00',
                context.watch<FloatModel>().getNoteCount,
                context.read<FloatModel>().setNoteCount,
              ),
              CashSpinBox(
                4,
                '\$100.00',
                context.watch<FloatModel>().getNoteCount,
                context.read<FloatModel>().setNoteCount,
              ),
            ]))),
            BottomNavigation(
                text:
                    '\$${context.watch<FloatModel>().getTotalNotes.toStringAsFixed(2)}',
                subText: "Target: \$${getRemainingFloatAmount()}",
                button: makeButton())
          ])));

  String getRemainingFloatAmount() =>
      (context.read<FloatModel>().getTotalFloat -
              context.read<FloatModel>().getTotalCoins)
          .toStringAsFixed(2);

  Widget makeInstructionText() {
    return MessageBox(Text(
        'Remove \$${getRemainingFloatAmount()} in notes from the till and add it to the float, the remaining will be for the bank takings.\n\nEnter the amount removed below.',
        style: const TextStyle(color: Colors.black)));
  }

  Widget makeButton() {
    final double remainingFloatAmount = double.parse(
        (context.read<FloatModel>().getTotalFloat -
                context.read<FloatModel>().getTotalCoins)
            .toStringAsFixed(2));
    double floatTotalNotes = context.watch<FloatModel>().getTotalNotes;
    return NextButton(
        destination: '/takings',
        callback: updateNoteTakings,
        condition: remainingFloatAmount == floatTotalNotes);
  }

  void updateNoteTakings() {
    List<double> notesInTill = context.read<TillModel>().getAllNoteCount;
    List<double> notesInFloat = context.read<FloatModel>().getAllNoteCount;
    List<double> notesInTakings = IterableZip([notesInTill, notesInFloat])
        .map((value) => value[0] - value[1])
        .toList();
    context.read<TakingModel>().addNoteCount(notesInTakings);
  }

  Future<bool> updateCoinFloat() {
    List<double> takings = context.read<TakingModel>().getAllCoinCount;
    List<double> safeCoins = context.read<SafeModel>().getAllCoinCount;
    List<double> tillCoins = context.read<TillModel>().getAllCoinCount;

    List<double> totalFloatCoins = IterableZip([safeCoins, tillCoins, takings])
        .map((value) => value[0] + value[1] - value[2])
        .toList();

    context.read<FloatModel>().subtractCoinCount(totalFloatCoins);

    return Future.value(true);
  }
}
