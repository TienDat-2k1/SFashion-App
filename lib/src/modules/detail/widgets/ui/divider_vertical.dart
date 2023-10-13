import 'package:flutter/material.dart';

class DividerVertical extends StatelessWidget {
  const DividerVertical({
    super.key,
    this.height = 10,
    this.color = Colors.grey,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      color: color,
    );
  }
}
