import 'package:equatable/equatable.dart';

abstract class ReviewsEvent extends Equatable {
  const ReviewsEvent();
}

class LoadReviewsEvent extends ReviewsEvent {
  final String idProduct;

  const LoadReviewsEvent(this.idProduct);

  @override
  List<Object?> get props => [];
}
