import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/constants/properties.dart';

class AmountBar extends StatelessWidget {
  const AmountBar({
    super.key,
    required this.amount,
    this.onIncrease,
    this.onDescrease,
  });

  final int amount;
  final Function()? onIncrease;
  final Function()? onDescrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDescrease,
          child: const FaIcon(
            FontAwesomeIcons.minus,
            size: Properties.sizeStar,
          ),
        ),
        const SizedBox(width: Properties.kPaddingMedium),
        Text(
          amount.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        const SizedBox(width: Properties.kPaddingMedium),
        GestureDetector(
          onTap: onIncrease,
          child: const FaIcon(
            FontAwesomeIcons.plus,
            size: Properties.sizeStar,
          ),
        ),
      ],
    );
  }
}
