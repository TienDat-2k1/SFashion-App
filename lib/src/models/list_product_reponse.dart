import 'package:s_fashion/src/models/product.dart';

class ListProductReponse {
  final List<Product>? products;
  final String? error;

  const ListProductReponse({this.products, this.error});

  ListProductReponse.fromJson(List<dynamic> data)
      : error = null,
        products = data
            .map(
              (product) => Product.fromJson(product as Map<String, dynamic>),
            )
            .toList();

  ListProductReponse.error(String mesError)
      : error = mesError,
        products = null;
}
