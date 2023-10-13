import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
    super.key,
    required this.size,
    this.isChosen = false,
    this.onTap,
  });

  final String size;
  final bool isChosen;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(Properties.kRadiusSmall),
          color: isChosen ? Theme.of(context).colorScheme.primary : null,
        ),
        child: Text(
          size,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: isChosen
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
