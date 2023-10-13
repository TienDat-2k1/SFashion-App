import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/widgets/submit_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonsSubmit extends StatelessWidget {
  const ButtonsSubmit({
    super.key,
    this.addCart,
    this.buyProduct,
  });

  final Function()? addCart;
  final Function()? buyProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Properties.kPaddingSmall),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: addCart,
              child: Text(
                AppLocalizations.of(context)!.add_cart,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SubmitButton(
              title: AppLocalizations.of(context)!.buy_now,
              height: 50,
              width: double.infinity,
              onClick: buyProduct,
            ),
          ),
        ],
      ),
    );
  }
}
