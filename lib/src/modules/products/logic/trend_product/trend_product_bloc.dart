import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/trend_product/trend_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/trend_product/trend_product_state.dart';
import 'package:s_fashion/src/repositories/product_query/trend_product_query.dart';

class TrendProductBloc extends Bloc<TrendProductEvent, TrendProductState> {
  TrendProductBloc() : super(const InitState()) {
    on<LoadTrendProducEvent>((event, emit) async {
      emit(const LoadingTrendProductState());
      final reponse = await TrendProductQuery.getLimitTrendProduct(0);

      if (reponse.error == null) {
        emit(LoadedTrendProductState(reponse));
      } else {
        emit(ErrorTrendProductState(reponse));
      }
    });
  }
}
