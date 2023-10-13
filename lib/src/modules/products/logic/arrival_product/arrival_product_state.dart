import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/list_product_reponse.dart';

abstract class ArrivalProductState extends Equatable {
  final ListProductReponse? reponse;

  const ArrivalProductState({this.reponse});
}

class LoadingArrivalProductState extends ArrivalProductState {
  const LoadingArrivalProductState() : super();

  @override
  List<Object?> get props => [];
}

class LoadedArrivalProductState extends ArrivalProductState {
  const LoadedArrivalProductState(ListProductReponse reponse)
      : super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class ErrorArrivalProductState extends ArrivalProductState {
  final String messError;

  ErrorArrivalProductState(ListProductReponse reponse)
      : messError = reponse.error!,
        super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class InitState extends ArrivalProductState {
  const InitState();

  @override
  List<Object?> get props => [];
}
