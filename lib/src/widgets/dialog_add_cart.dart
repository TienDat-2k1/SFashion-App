import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_bloc.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_event.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/text_sale.dart';
import 'package:s_fashion/src/modules/detail/widgets/ui/sizes_bar.dart';
import 'package:s_fashion/src/utils/utils.dart';
import 'package:s_fashion/src/widgets/amount_bar.dart';
import 'package:s_fashion/src/widgets/submit_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TypeShowDialog { add, buy }

class DialogAddCart extends StatefulWidget {
  const DialogAddCart({
    super.key,
    required this.product,
    this.type = TypeShowDialog.add,
  });

  final Product product;
  final TypeShowDialog type;

  @override
  State<DialogAddCart> createState() => _DialogAddCartState();
}

class _DialogAddCartState extends State<DialogAddCart> {
  late int amount;
  late String size;

  @override
  void initState() {
    super.initState();
    setState(() {
      amount = 1;
      size = widget.product.sizes[0];
    });
  }

  void addCart() {
    BlocProvider.of<CartBloc>(context).add(
      AddCartEvent(
        product: widget.product,
        amount: amount,
        size: size,
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      Utils.getSnackBar(
        context,
        'Add successlly order',
        TypeSnackBar.success,
      ),
    );

    Navigator.of(context).pop(true);
  }

  void makeBill() {}

  void setSize(int index) {
    final newSize = widget.product.sizes[index];

    if (newSize == size) {
      return;
    }

    setState(() {
      size = newSize;
    });
  }

  void plusAmount(int count) {
    amount += count;

    if (amount > 20) {
      return;
    }

    if (amount <= 0) {
      Navigator.of(context).pop(false);
      return;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var titleButton = AppLocalizations.of(context)!.add_cart;
    var onClick = addCart;

    if (widget.type == TypeShowDialog.buy) {
      titleButton = AppLocalizations.of(context)!.buy_now;
      onClick = makeBill;
    }

    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Properties.kRadiusSmall),
                topLeft: Radius.circular(Properties.kRadiusSmall),
              ),
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(Properties.kRadiusSmall),
                topLeft: Radius.circular(Properties.kRadiusSmall),
              ),
              child: FadeInImage(
                width: double.infinity,
                placeholder: const AssetImage(MyImages.imgPlaceHodler),
                image: NetworkImage(
                  Utils.getUrlImageProduct(widget.product.imageCover),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(Properties.kPaddingSmall),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.amount}:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    AmountBar(
                      amount: amount,
                      onIncrease: () => plusAmount(1),
                      onDescrease: () => plusAmount(-1),
                    ),
                  ],
                ),
                const SizedBox(height: Properties.kPaddingMedium),
                SizesBar(
                  sizes: widget.product.sizes,
                  currentSize: size,
                  selectedSize: setSize,
                ),
                const SizedBox(height: Properties.kPaddingLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.price}:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${Utils.convertCurrencyFormat(widget.product.price.toDouble())} x $amount',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                          maxLines: 1,
                        ),
                        TextSale(
                          price: widget.product.price.toDouble() * amount,
                          saleOff: widget.product.saleOff.toDouble(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Properties.kPaddingSmall),
                SubmitButton(
                  title: titleButton,
                  onClick: onClick,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
