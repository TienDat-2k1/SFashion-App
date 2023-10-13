import 'package:flutter/material.dart';
import 'package:s_fashion/src/modules/detail/widgets/ui/size_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SizesBar extends StatelessWidget {
  const SizesBar({
    super.key,
    required this.sizes,
    this.currentSize,
    this.selectedSize,
  });

  final List<String> sizes;
  final Function(int)? selectedSize;
  final String? currentSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: selectedSize != null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${AppLocalizations.of(context)!.sizes}: ",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        Row(
          children: sizes
              .map(
                (size) => SizeItem(
                  size: size,
                  isChosen: currentSize == size,
                  onTap: selectedSize != null
                      ? () => selectedSize!(sizes.indexOf(size))
                      : null,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
