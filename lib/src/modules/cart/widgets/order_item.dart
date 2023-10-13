import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/order.dart';
import 'package:s_fashion/src/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/widgets/amount_bar.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.order,
    this.delOrder,
    this.onIncrease,
    this.onDescrease,
    this.onInfo,
  });

  final Order order;
  final Function()? delOrder;
  final Function()? onIncrease;
  final Function()? onDescrease;
  final Function()? onInfo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Container(
              color: MyColors.colorGreen,
              height: 140,
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.info),
                iconSize: Properties.sizeIconButton,
                color: Theme.of(context).colorScheme.background,
                onPressed: onInfo,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.error,
              height: 140,
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.trash),
                iconSize: Properties.sizeIconButton,
                color: Theme.of(context).colorScheme.background,
                onPressed: delOrder,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: Properties.kPaddingSmall),
        child: Card(
          elevation: 1,
          child: SizedBox(
            height: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Properties.kRadiusSmall),
                    bottomLeft: Radius.circular(Properties.kRadiusSmall),
                  ),
                  child: FadeInImage(
                    placeholder: const AssetImage(MyImages.imgPlaceHodler),
                    image: NetworkImage(
                      Utils.getUrlImageProduct(order.product.imageCover),
                    ),
                    fit: BoxFit.cover,
                    width: 110,
                    height: double.infinity,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(Properties.kPaddingSmall),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${AppLocalizations.of(context)!.sizes}: ${order.size}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Consumer<Order>(
                          builder: (context, value, child) => Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AmountBar(
                                amount: order.amount,
                                onIncrease: onIncrease,
                                onDescrease: () {
                                  if (order.amount <= 1 && delOrder != null) {
                                    delOrder!();
                                  } else {
                                    if (onDescrease != null) {
                                      onDescrease!();
                                    }
                                  }
                                },
                              ),
                              Text(
                                Utils.convertCurrencyFormat(
                                    order.getSumPrice()),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
