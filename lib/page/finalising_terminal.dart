import 'package:app/provider/taking_provider.dart';
import 'package:app/widget/cell.dart';
import 'package:app/widget/z_read_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';

class FinalisingTerminalPage extends StatefulWidget {
  const FinalisingTerminalPage({Key? key}) : super(key: key);

  @override
  _FinalisingTerminalPageState createState() => _FinalisingTerminalPageState();
}

class _FinalisingTerminalPageState extends State<FinalisingTerminalPage> {
  int _index = 0;
  final DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Step> stepList = <Step>[
      Step(
          isActive: _index >= 0,
          title: const Text('Bag Up Bank Taking'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Place bank takings into a paper bag, staple it, and write:\n\n• Your name\n• Today\'s date: ${DateFormat('dd/MM/yyyy').format(now)}\n• Total bank takings: \$${context.read<TakingModel>().getTotal.toStringAsFixed(2)}'))),
      Step(
          isActive: _index >= 1,
          title: const Text('Print Z-Read'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Column(children: [
                const Text('Enter the following to the POS machine Z-Read\n'),
                makeTable(),
                Text(
                    'Total: \$${context.read<TakingModel>().getTotal.toStringAsFixed(2)}')
              ])))
    ];

    return Scaffold(
        appBar: AppBar(title: const Text('Finalising (Z-Read)')),
        body: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < stepList.length - 1) {
              setState(() {
                _index += 1;
              });
            } else {
              Navigator.pushNamed(context, '/finalising_tablet');
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: stepList,
        ));
  }

  Widget makeTable() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: const ZReadTable());
  }
}
