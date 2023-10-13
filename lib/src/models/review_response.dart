import 'package:s_fashion/src/models/review.dart';

class ListReviewResponse {
  final List<Review>? reviews;
  final String? error;

  const ListReviewResponse({this.reviews, this.error});

  ListReviewResponse.fromJson(List<dynamic> data)
      : error = null,
        reviews = data
            .map(
              (review) => Review.fromJson(review as Map<String, dynamic>),
            )
            .toList();

  ListReviewResponse.error(String mesError)
      : error = mesError,
        reviews = null;
}
