import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:s_fashion/src/constants/base_url.dart';
import 'package:s_fashion/src/models/review_response.dart';

final dio = Dio();
final logger = Logger();

class ReviewsQuery {
  static Future<ListReviewResponse> getlimitReviews(
      int numberLimit, String idProduct) async {
    try {
      final response = await dio.get(BaseUrl.reviewsProduct(idProduct));

      if (response.statusCode == 200) {
        //logger.i(response.data);
        if (response.data != null) {
          final list = response.data['data']['data'] as List<dynamic>;
          return ListReviewResponse.fromJson(list);
        }
      }
    } catch (e) {
      logger.e(e.toString());
    }
    return ListReviewResponse.error("Failured in get product's reviews");
  }
}
