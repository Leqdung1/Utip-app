
import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required this.personCount,
    required this.onDecrement,
    required this.onIncrement,
  });

  final ThemeData theme;
  final int personCount;

  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Split',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            IconButton(
              color: theme.colorScheme.primary,
              onPressed: onDecrement,
              icon: const Icon(Icons.remove),
            ),
            Text(
              '$personCount',
              style: theme.textTheme.titleMedium,
            ),
            IconButton(
              color: theme.colorScheme.primary,
              onPressed: onIncrement,
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
