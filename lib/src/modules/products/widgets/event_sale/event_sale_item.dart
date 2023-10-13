import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/config/themes/styles.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/event_sale.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/modules/products/widgets/event_sale/event_sale_button.dart';

class EventSaleItem extends StatelessWidget {
  const EventSaleItem({
    super.key,
    required this.event,
  });

  final EventSale event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            event.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: Properties.kPaddingLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                event.title,
                style: Style.styleLogo.copyWith(
                  color: MyColors.colorBlack,
                  fontSize: 26,
                ),
              ),
              Text(
                "${AppLocalizations.of(context)!.sale}  ${event.salePercent}%",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: MyColors.colorRed,
                    ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: Properties.kPaddingLarge,
          left: Properties.kPaddingLarge,
          child: EventSaleButton(),
        ),
      ],
    );
  }
}
