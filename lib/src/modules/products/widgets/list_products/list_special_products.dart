import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/routes/app_router.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/products/widgets/list_products/product_item.dart';
import 'package:s_fashion/src/modules/products/widgets/ui/text_more.dart';
import 'package:s_fashion/src/widgets/dialog_add_cart.dart';

class ListSpecialProdcuts extends StatelessWidget {
  const ListSpecialProdcuts({
    super.key,
    required this.title,
    required this.description,
    required this.products,
  });

  final String title;
  final String description;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    void onSelectProduct(Product product) {
      context.router.push(DetailRoute(product: product));
    }

    void onAddCart(Product product) {
      showDialog(
        context: context,
        builder: (context) => DialogAddCart(product: product),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: Properties.kPaddingMedium),
      padding: const EdgeInsets.all(Properties.kPaddingSmall),
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: MyColors.colorOrrage),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Properties.kPaddingSmall),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Properties.kPaddingLarge),
                TextMore(onClick: () {}),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: products
                    .map(
                      (product) => ProductItem(
                        key: UniqueKey(),
                        product: product,
                        onSelected: onSelectProduct,
                        onAddCart: onAddCart,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
