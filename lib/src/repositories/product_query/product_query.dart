import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:s_fashion/src/constants/base_url.dart';
import 'package:s_fashion/src/models/product.dart';

final dio = Dio();
final logger = Logger();

class ProductQuery {
  static Future<Product?> getInfoProduct(String id) async {
    try {
      final response = await dio.get(BaseUrl.getInfoProduct(id));
      //logger.i(response);
      if (response.statusCode == 200) {
        // logger.i(response.data);
        if (response.data != null) {
          final map = response.data['data']['data'] as Map<String, dynamic>;
          return Product.fromJson(map);
        }
      }
    } catch (e) {
      logger.e(e.toString());
    }
    return null;
  }
}
