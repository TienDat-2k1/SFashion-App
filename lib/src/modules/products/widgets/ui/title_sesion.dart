import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';

class TitleSesion extends StatelessWidget {
  const TitleSesion({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
        const SizedBox(width: Properties.kPaddingSmall),
        Expanded(
          child: Divider(color: Theme.of(context).colorScheme.surface),
        ),
      ],
    );
  }
}
