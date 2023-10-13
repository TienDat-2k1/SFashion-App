import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/list_product_reponse.dart';

abstract class SaleProductState extends Equatable {
  final ListProductReponse? reponse;

  const SaleProductState({this.reponse});
}

class LoadingSaleProductState extends SaleProductState {
  const LoadingSaleProductState() : super();

  @override
  List<Object?> get props => [];
}

class LoadedSaleProductState extends SaleProductState {
  const LoadedSaleProductState(ListProductReponse reponse)
      : super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class ErrorSaleProductState extends SaleProductState {
  final String messError;

  ErrorSaleProductState(ListProductReponse reponse)
      : messError = reponse.error!,
        super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class InitState extends SaleProductState {
  const InitState();

  @override
  List<Object?> get props => [];
}
