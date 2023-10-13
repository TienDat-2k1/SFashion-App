import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/utils/utils.dart';
import 'package:s_fashion/src/widgets/rating_section.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.onSelected,
    this.onAddCart,
  });

  final Product product;
  final Function(Product)? onSelected;
  final Function(Product)? onAddCart;

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final double widthItem = widthDevice >= 700 ? 230 : 180;
    final double heightItem = widthDevice >= 700 ? 365 : 325;

    return InkWell(
      onTap: onSelected == null ? null : () => onSelected!(product),
      child: Container(
        width: widthItem,
        height: heightItem,
        margin: const EdgeInsets.all(Properties.kPaddingSmall),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Properties.kRadiusMedium),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Properties.kRadiusMedium),
                topRight: Radius.circular(Properties.kRadiusMedium),
              ),
              child: SizedBox(
                height: heightItem * 3 / 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FadeInImage(
                      placeholder: const AssetImage(MyImages.imgPlaceHodler),
                      image: NetworkImage(
                        Utils.getUrlImageProduct(product.imageCover),
                      ),
                      fit: BoxFit.cover,
                    ),
                    if (product.saleOff > 0)
                      Positioned(
                        right: Properties.kPaddingSmall,
                        top: 0,
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          width: 30,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text(
                            '${product.saleOff}%',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Properties.kPaddingSmall),
            RatingSection(point: product.ratingsAverage.toDouble()),
            const SizedBox(height: Properties.kPaddingSmall),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Properties.kPaddingSmall,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: Properties.kPaddingSmall),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Utils.convertCurrencyFormat(
                                  product.price * (1 - product.saleOff / 100),
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.bold,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (product.saleOff > 0)
                                Text(
                                  Utils.convertCurrencyFormat(
                                    product.price.toDouble(),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: onAddCart == null
                              ? null
                              : () => onAddCart!(product),
                          child: Container(
                            padding: const EdgeInsets.all(
                              Properties.kPaddingSmall,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.cartShopping,
                              size: Properties.sizeStar,
                              color: MyColors.colorOrrage,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
