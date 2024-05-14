import 'package:first_app/widget/person_count.dart';
import 'package:first_app/widget/bill_amount.dart';
import 'package:first_app/widget/slider_tip.dart';
import 'package:first_app/widget/total_per_person.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Utip(),
    );
  }
}

class Utip extends StatefulWidget {
  const Utip({super.key});

  @override
  State<Utip> createState() => _UTipState();
}

class _UTipState extends State<Utip> {
  int personCount = 0;
  double _tipPercent = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return ((_billTotal * _tipPercent) + _billTotal) / personCount;
  }

  void increase() {
    setState(() {
      personCount++;
    });
  }

  void decrease() {
    setState(() {
      if (personCount > 1) {
        personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    double total = totalPerPerson();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Utip app'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          total_Per_Person(total: total),
          // form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.primary,
                ),
              ),
              child: Column(
                children: [
                  BillAmount(
                    billAmount: _billTotal.toString(),
                    onchanged: (value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                    },
                  ),
                  // split area
                  PersonCounter(
                    theme: theme,
                    personCount: personCount,
                    onDecrement: decrease,
                    onIncrement: increase,
                  ),

                  // Tip section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tip',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        '${(_tipPercent * 100).round()}%',
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),

                  // text slider
                  Text(
                    '${(_tipPercent * 100).round()}%',
                    style: theme.textTheme.titleMedium,
                  ),

                  // slider
                  TipSlider(
                    tipPercent: _tipPercent,
                    onchanged: (double value) {
                      setState(() {
                        _tipPercent = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
