import 'package:flutter/material.dart';

class BillAmount extends StatelessWidget {
  const BillAmount(
      {super.key, required this.billAmount, required this.onchanged});
  final String billAmount;
  final ValueChanged<String> onchanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
        labelText: 'Bill Amount',
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value){
        onchanged(value);
      }
    );
  }
}
