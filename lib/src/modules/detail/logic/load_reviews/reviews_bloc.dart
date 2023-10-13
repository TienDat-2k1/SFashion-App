import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/detail/logic/load_reviews/reviews_event.dart';
import 'package:s_fashion/src/modules/detail/logic/load_reviews/reviews_state.dart';
import 'package:s_fashion/src/repositories/review_query/review_query.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(const InitState()) {
    on<LoadReviewsEvent>((event, emit) async {
      emit(const LoadingReviewsState());
      final reponse = await ReviewsQuery.getlimitReviews(0, event.idProduct);

      if (reponse.error == null) {
        emit(LoadedReviewsState(reponse));
      } else {
        emit(ErrorReviewsState(reponse));
      }
    });
  }
}
