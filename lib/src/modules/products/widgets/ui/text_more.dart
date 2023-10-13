import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';

class TextMore extends StatelessWidget {
  const TextMore({
    super.key,
    required this.onClick,
  });

  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onClick,
        child: Text(
          AppLocalizations.of(context)!.more,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: MyColors.colorGray),
        ),
      ),
    );
  }
}
