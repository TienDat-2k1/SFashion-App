import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/list_product_reponse.dart';

abstract class TrendProductState extends Equatable {
  final ListProductReponse? reponse;

  const TrendProductState({this.reponse});
}

class LoadingTrendProductState extends TrendProductState {
  const LoadingTrendProductState() : super();

  @override
  List<Object?> get props => [];
}

class LoadedTrendProductState extends TrendProductState {
  const LoadedTrendProductState(ListProductReponse reponse)
      : super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class ErrorTrendProductState extends TrendProductState {
  final String messError;

  ErrorTrendProductState(ListProductReponse reponse)
      : messError = reponse.error!,
        super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class InitState extends TrendProductState {
  const InitState();

  @override
  List<Object?> get props => [];
}
