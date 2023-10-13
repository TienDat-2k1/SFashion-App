import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventSaleButton extends StatelessWidget {
  const EventSaleButton({
    super.key,
    this.onGetMore,
  });

  final void Function()? onGetMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onGetMore,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(Properties.kPaddingMedium),
        decoration: BoxDecoration(
          color: MyColors.colorOrrage,
          borderRadius: BorderRadius.circular(Properties.kPaddingSmall),
        ),
        child: Text(
          AppLocalizations.of(context)!.get_more,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
