import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/hot_product/hot_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/hot_product/hot_product_state.dart';
import 'package:s_fashion/src/repositories/product_query/hot_product_query.dart';

class HotProductBloc extends Bloc<HotProductEvent, HotProductState> {
  HotProductBloc() : super(const InitState()) {
    on<LoadHotProducEvent>((event, emit) async {
      emit(const LoadingHotProductState());
      final reponse = await HotProductQuery.getLimitHotProduct(0);

      if (reponse.error == null) {
        emit(LoadedHotProductState(reponse));
      } else {
        emit(ErrorHotProductState(reponse));
      }
    });
  }
}
