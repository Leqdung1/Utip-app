import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercent,
    required this.onchanged,
  }) : _tipPercent = tipPercent;

  final double _tipPercent;
  final ValueChanged<double> onchanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPercent,
      onChanged: onchanged,
      min: 0.0,
      max: 0.5,
      divisions: 5,
      label: '${(_tipPercent * 100).round()}%',
    );
  }
}
