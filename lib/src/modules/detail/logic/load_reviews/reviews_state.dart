import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/review_response.dart';

abstract class ReviewsState extends Equatable {
  final ListReviewResponse? reponse;

  const ReviewsState({this.reponse});
}

class LoadingReviewsState extends ReviewsState {
  const LoadingReviewsState() : super();

  @override
  List<Object?> get props => [];
}

class LoadedReviewsState extends ReviewsState {
  const LoadedReviewsState(ListReviewResponse reponse)
      : super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class ErrorReviewsState extends ReviewsState {
  final String messError;

  ErrorReviewsState(ListReviewResponse reponse)
      : messError = reponse.error!,
        super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class InitState extends ReviewsState {
  const InitState();

  @override
  List<Object?> get props => [];
}
