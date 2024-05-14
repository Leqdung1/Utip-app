import 'package:flutter/material.dart';

// ignore: camel_case_types
class total_Per_Person extends StatelessWidget {
  const total_Per_Person({
    super.key,
    required this.total,
  });

  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 137, 88, 222),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Text(
              'Total Per Person',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(total.toStringAsFixed(2),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                )),
          ],
        ));
  }
}
