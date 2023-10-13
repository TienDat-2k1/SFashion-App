import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/utils/utils.dart';

class TextSale extends StatelessWidget {
  const TextSale({
    super.key,
    required this.price,
    this.saleOff = 0,
  });

  final double price;
  final double saleOff;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          Utils.convertCurrencyFormat(price * (1 - saleOff / 100)),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
        if (saleOff > 0) const SizedBox(width: Properties.kPaddingSmall),
        if (saleOff > 0)
          Text(
            Utils.convertCurrencyFormat(price.toDouble()),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  decoration: TextDecoration.lineThrough,
                ),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
      ],
    );
  }
}
