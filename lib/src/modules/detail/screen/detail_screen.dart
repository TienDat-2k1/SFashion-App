import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/detail/widgets/buttons_submit/buttons_submit.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/detail_body.dart';
import 'package:s_fashion/src/modules/detail/widgets/list_image/images_section.dart';
import 'package:s_fashion/src/widgets/button_cart.dart';
import 'package:s_fashion/src/widgets/dialog_add_cart.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.product,
    this.isShowActionBar = true,
  });

  final Product product;
  final bool isShowActionBar;

  @override
  Widget build(BuildContext context) {
    void addCart(Product product) {
      showDialog(
        context: context,
        builder: (context) => DialogAddCart(product: product),
      );
    }

    void buyNow(Product product) {
      showDialog(
        context: context,
        builder: (context) => DialogAddCart(
          product: product,
          type: TypeShowDialog.buy,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: isShowActionBar ? const [ButtonCart()] : null,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ImagesSection(images: product.allImages),
                  const SizedBox(height: Properties.kPaddingSmall),
                  DetailBody(
                    idProduct: product.id,
                    nameProduct: product.name,
                    averageProduct: product.ratingsAverage.toDouble(),
                    quantityProduct: product.ratingsQuantity.toInt(),
                    soldProduct: product.sold.toInt(),
                    material: product.material,
                    sizes: product.sizes,
                    description: product.description,
                    price: product.price.toDouble(),
                    saleOff: product.saleOff.toDouble(),
                  ),
                ],
              ),
            ),
          ),
          ButtonsSubmit(
            addCart: () => addCart(product),
            buyProduct: () => buyNow(product),
          ),
        ],
      ),
    );
  }
}
