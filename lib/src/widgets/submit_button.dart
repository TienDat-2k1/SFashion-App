import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.onClick,
    this.elevation,
  });

  final String title;
  final double? width;
  final double? height;
  final double? elevation;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: onClick,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(Properties.kPaddingSmall),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
