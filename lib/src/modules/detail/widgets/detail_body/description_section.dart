import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/detail/widgets/ui/button_more.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key, required this.description});

  final String description;

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  var isExpanded = false;

  void changeModeExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Properties.kPaddingSmall),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Properties.kRadiusMedium),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.surface,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context)!.description}: ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: Properties.kPaddingSmall),
          AnimatedContainer(
            padding: const EdgeInsets.symmetric(
              horizontal: Properties.kPaddingSmall,
            ),
            duration: const Duration(milliseconds: 300),
            constraints: const BoxConstraints(minHeight: 50, maxHeight: 180),
            width: double.infinity,
            height: isExpanded ? double.infinity : 50,
            child: SingleChildScrollView(
              child: Text(
                widget.description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          ButtonMore(
            text: isExpanded
                ? AppLocalizations.of(context)!.close
                : AppLocalizations.of(context)!.more,
            onClick: changeModeExpand,
          ),
        ],
      ),
    );
  }
}
