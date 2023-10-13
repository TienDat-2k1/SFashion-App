import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/category/category_event.dart';
import 'package:s_fashion/src/modules/products/logic/category/category_state.dart';
import 'package:s_fashion/src/repositories/category_query/category_query.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const InitState()) {
    on<LoadCategoriesEvent>(
      (event, emit) async {
        emit(const LoadingCategoryState());

        final reponse = await CategoryQuery.getAllCategories();

        if (reponse.error == null) {
          emit(LoadedCategoryState(reponse));
        } else {
          emit(ErrorCategoryState(reponse));
        }
      },
    );
  }
}
