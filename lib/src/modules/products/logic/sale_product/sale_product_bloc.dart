import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/sale_product/sale_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/sale_product/sale_product_state.dart';
import 'package:s_fashion/src/repositories/product_query/sale_product_query.dart';

class SaleProductBloc extends Bloc<HotProductEvent, SaleProductState> {
  SaleProductBloc() : super(const InitState()) {
    on<LoadSaleProducEvent>((event, emit) async {
      emit(const LoadingSaleProductState());
      final reponse = await SaleProductQuery.getLimitSaleProduct(0);

      if (reponse.error == null) {
        emit(LoadedSaleProductState(reponse));
      } else {
        emit(ErrorSaleProductState(reponse));
      }
    });
  }
}
