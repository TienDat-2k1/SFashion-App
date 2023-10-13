import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.isExpanded,
  });

  final bool isExpanded;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      constraints: BoxConstraints(
        maxWidth: widget.isExpanded ? 200 : 0,
        minWidth: widget.isExpanded ? 200 : 0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: Properties.kPaddingMedium,
        horizontal: Properties.kPaddingSmall,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Properties.kRadiusLarge),
        color: Theme.of(context).colorScheme.background,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Properties.kPaddingSmall,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
              hintMaxLines: 1,
              hintText: AppLocalizations.of(context)!.hint_search,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MyColors.colorGray,
                  ),
              border: InputBorder.none,
            ),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            onChanged: (name) {
              // Search products by name
            },
          ),
        ),
      ),
    );
  }
}
