import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/category_reponse.dart';

abstract class CategoryState extends Equatable {
  final CategoryReponse? reponse;

  const CategoryState({this.reponse});
}

class LoadingCategoryState extends CategoryState {
  const LoadingCategoryState() : super();

  @override
  List<Object?> get props => [];
}

class LoadedCategoryState extends CategoryState {
  const LoadedCategoryState(CategoryReponse reponse) : super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class ErrorCategoryState extends CategoryState {
  final String messError;

  ErrorCategoryState(CategoryReponse reponse)
      : messError = reponse.error!,
        super(reponse: reponse);

  @override
  List<Object?> get props => [];
}

class InitState extends CategoryState {
  const InitState();

  @override
  List<Object?> get props => [];
}
