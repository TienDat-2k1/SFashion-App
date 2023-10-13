import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/arrival_product/arrival_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/arrival_product/arrival_product_state.dart';
import 'package:s_fashion/src/repositories/product_query/arrival_product_query.dart';

class ArrivalProductBloc
    extends Bloc<ArrivalProductEvent, ArrivalProductState> {
  ArrivalProductBloc() : super(const InitState()) {
    on<LoadArrivalProducEvent>((event, emit) async {
      emit(const LoadingArrivalProductState());
      final reponse = await ArrivalProductQuery.getLimitArrivalProduct(0);

      if (reponse.error == null) {
        emit(LoadedArrivalProductState(reponse));
      } else {
        emit(ErrorArrivalProductState(reponse));
      }
    });
  }
}
