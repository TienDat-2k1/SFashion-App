import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:s_fashion/src/models/list_product_reponse.dart';

import '../../constants/base_url.dart';

final dio = Dio();
final logger = Logger();

class ArrivalProductQuery {
  static Future<ListProductReponse> getLimitArrivalProduct(
      int numberLimit) async {
    try {
      final response = await dio.get(BaseUrl.getAllArrivalProduct);

      if (response.statusCode == 200) {
        // logger.i(response.data);
        if (response.data != null) {
          final list = response.data['data']['data'] as List<dynamic>;
          return ListProductReponse.fromJson(list);
        }
      }
    } catch (e) {
      logger.e(e.toString());
      return ListProductReponse.error('Failured in get arrival products');
    }
    return ListProductReponse.error('Failured in get arrival products');
  }
}
