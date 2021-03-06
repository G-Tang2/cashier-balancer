import 'package:app/provider/float_provider.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:app/widget/bottom_navigation.dart';
import 'package:app/widget/cash_spinbox.dart';
import 'package:app/widget/message_box.dart';
import 'package:app/widget/next_button.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class CoinFloatPage extends StatefulWidget {
  const CoinFloatPage({Key? key}) : super(key: key);

  @override
  _CoinFloatPageState createState() => _CoinFloatPageState();
}

class _CoinFloatPageState extends State<CoinFloatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Coin Float')),
      body: Column(children: [
        Expanded(
            child: Scrollbar(
                child: ListView(children: [
          MessageBox(Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Remove \$${excessCoins().toStringAsFixed(2)} in coins from the till and add it to the bank takings, the remaining coins will be for the float.',
                      style: const TextStyle(color: Colors.black))),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('\nEnter the amount removed below.',
                      style: TextStyle(color: Colors.black)))
            ],
          )),
          CashSpinBox(
            0,
            '\$0.05',
            context.watch<TakingModel>().getCoinCount,
            context.read<TakingModel>().setCoinCount,
          ),
          CashSpinBox(
            1,
            '\$0.10',
            context.watch<TakingModel>().getCoinCount,
            context.read<TakingModel>().setCoinCount,
          ),
          CashSpinBox(
            2,
            '\$0.20',
            context.watch<TakingModel>().getCoinCount,
            context.read<TakingModel>().setCoinCount,
          ),
          CashSpinBox(
            3,
            '\$0.50',
            context.watch<TakingModel>().getCoinCount,
            context.read<TakingModel>().setCoinCount,
          ),
          CashSpinBox(
            4,
            '\$1.00',
            context.watch<TakingModel>().getCoinCount,
            context.read<TakingModel>().setCoinCount,
          ),
          CashSpinBox(
            5,
            '\$2.00',
            context.watch<TakingModel>().getCoinCount,
            context.read<TakingModel>().setCoinCount,
          ),
        ]))),
        BottomNavigation(
            text:
                '\$${context.watch<TakingModel>().getTotalCoins.toStringAsFixed(2)}',
            subText: "Target: \$${excessCoins().toStringAsFixed(2)}",
            button: makeButton())
      ]));

  Widget makeButton() {
    double coinTakings = context.watch<TakingModel>().getTotalCoins;
    return NextButton(
        destination: '/note_float',
        callback: updateCoinFloat,
        condition: coinTakings == excessCoins());
  }

  void updateCoinFloat() {
    List<double> takings = context.read<TakingModel>().getAllCoinCount;
    List<double> safeCoins = context.read<SafeModel>().getAllCoinCount;
    List<double> tillCoins = context.read<TillModel>().getAllCoinCount;

    List<double> totalFloatCoins = IterableZip([safeCoins, tillCoins, takings])
        .map((value) => value[0] + value[1] - value[2])
        .toList();

    context.read<FloatModel>().addCoinCount(totalFloatCoins);
  }

  double excessCoins() {
    double totalCoins = context.read<SafeModel>().getTotal +
        context.read<TillModel>().getTotalCoins;
    return double.parse((totalCoins % 5).toStringAsFixed(2));
  }
}
