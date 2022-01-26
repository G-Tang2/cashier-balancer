import 'package:app/provider/safe_provider.dart';
import 'package:app/widget/cash_spinbox.dart';
import 'package:app/widget/message_box.dart';
import 'package:app/widget/bottom_navigation.dart';
import 'package:app/widget/next_button.dart';
import 'package:app/widget/safe_horizontal_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SafePage extends StatefulWidget {
  const SafePage({Key? key}) : super(key: key);

  @override
  _SafePageState createState() => _SafePageState();
}

class _SafePageState extends State<SafePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Safe')),
        body: Column(children: [
          Expanded(
              child: Scrollbar(
                  child: ListView(children: [
            const MessageBox(Text(
              'Enter the number of rolls for each coin denomination.',
              style: TextStyle(color: Colors.black),
            )),
            CashSpinBox(
              0,
              '\$0.05',
              context.watch<SafeModel>().get,
              context.read<SafeModel>().set,
            ),
            CashSpinBox(
              1,
              '\$0.10',
              context.watch<SafeModel>().get,
              context.read<SafeModel>().set,
            ),
            CashSpinBox(
              2,
              '\$0.20',
              context.watch<SafeModel>().get,
              context.read<SafeModel>().set,
            ),
            CashSpinBox(
              3,
              '\$0.50',
              context.watch<SafeModel>().get,
              context.read<SafeModel>().set,
            ),
            CashSpinBox(
              4,
              '\$1.00',
              context.watch<SafeModel>().get,
              context.read<SafeModel>().set,
            ),
            CashSpinBox(
              5,
              '\$0.50',
              context.watch<SafeModel>().get,
              context.read<SafeModel>().set,
            )
          ]))),
          BottomNavigation(
              text:
                  '\$${context.watch<SafeModel>().getTotal.toStringAsFixed(2)}',
              button: const NextButton(destination: '/till')),
        ]),
      );
}
