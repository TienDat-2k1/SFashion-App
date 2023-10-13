import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/list_product_reponse.dart';

abstract class HotProductState extends Equatable {
  final ListProductReponse? reponse;

  const HotProductState({this.reponse});
}

class LoadingHotProductState extends HotProductState {
  const LoadingHotProductState() : super();

  @override
  List<Object?> get props => [];
}

class LoadedHotProductState extends HotProductState {
  const LoadedHotProductState(ListProductReponse reponse)
      : super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class ErrorHotProductState extends HotProductState {
  final String messError;

  ErrorHotProductState(ListProductReponse reponse)
      : messError = reponse.error!,
        super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class InitState extends HotProductState {
  const InitState();

  @override
  List<Object?> get props => [];
}
