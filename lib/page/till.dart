import 'package:app/provider/till_provider.dart';
import 'package:app/widget/bottom_navigation.dart';
import 'package:app/widget/cash_spinbox.dart';
import 'package:app/widget/message_box.dart';
import 'package:app/widget/next_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TillPage extends StatefulWidget {
  const TillPage({Key? key}) : super(key: key);

  @override
  _TillPageState createState() => _TillPageState();
}

class _TillPageState extends State<TillPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Till')),
      body: Column(children: [
        Expanded(
            child: Scrollbar(
                child: ListView(children: [
          const MessageBox(Text(
              'Enter the number coins and notes for each denomination.',
              style: TextStyle(color: Colors.black))),
          CashSpinBox(
            0,
            '\$0.05',
            context.watch<TillModel>().getCoinCount,
            context.read<TillModel>().setCoinCount,
          ),
          CashSpinBox(
            1,
            '\$0.10',
            context.watch<TillModel>().getCoinCount,
            context.read<TillModel>().setCoinCount,
          ),
          CashSpinBox(
            2,
            '\$0.20',
            context.watch<TillModel>().getCoinCount,
            context.read<TillModel>().setCoinCount,
          ),
          CashSpinBox(
            3,
            '\$0.50',
            context.watch<TillModel>().getCoinCount,
            context.read<TillModel>().setCoinCount,
          ),
          CashSpinBox(
            4,
            '\$1.00',
            context.watch<TillModel>().getCoinCount,
            context.read<TillModel>().setCoinCount,
          ),
          CashSpinBox(
            5,
            '\$2.00',
            context.watch<TillModel>().getCoinCount,
            context.read<TillModel>().setCoinCount,
          ),
          CashSpinBox(
            0,
            '\$5.00',
            context.watch<TillModel>().getNoteCount,
            context.read<TillModel>().setNoteCount,
          ),
          CashSpinBox(
            1,
            '\$10.00',
            context.watch<TillModel>().getNoteCount,
            context.read<TillModel>().setNoteCount,
          ),
          CashSpinBox(
            2,
            '\$20.00',
            context.watch<TillModel>().getNoteCount,
            context.read<TillModel>().setNoteCount,
          ),
          CashSpinBox(
            3,
            '\$50.00',
            context.watch<TillModel>().getNoteCount,
            context.read<TillModel>().setNoteCount,
          ),
          CashSpinBox(
            4,
            '\$100.00',
            context.watch<TillModel>().getNoteCount,
            context.read<TillModel>().setNoteCount,
          )
        ]))),
        BottomNavigation(
            text: '\$${context.watch<TillModel>().getTotal.toStringAsFixed(2)}',
            button: const NextButton(destination: '/coin_float'))
      ]));
}
