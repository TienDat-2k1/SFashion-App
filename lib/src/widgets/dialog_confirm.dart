import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/widgets/submit_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogConfirm extends StatelessWidget {
  const DialogConfirm({
    super.key,
    required this.title,
    required this.subtitle,
    this.onConfirm,
    this.onCancle,
  });

  final String title;
  final String subtitle;
  final Function()? onConfirm;
  final Function()? onCancle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: Properties.kPaddingSmall,
              vertical: Properties.kPaddingMedium,
            ),
            width: double.infinity,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(Properties.kPaddingSmall),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: onCancle,
                      child: Text(
                        AppLocalizations.of(context)!.cancle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    ),
                    const SizedBox(width: Properties.kPaddingSmall),
                    SubmitButton(
                      title: AppLocalizations.of(context)!.confirm,
                      onClick: onConfirm,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
