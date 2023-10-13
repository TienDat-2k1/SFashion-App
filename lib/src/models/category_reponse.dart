import 'package:s_fashion/src/models/category.dart';

class CategoryReponse {
  final List<Category>? categories;
  final String? error;

  const CategoryReponse({this.categories, this.error});

  CategoryReponse.fromJson(List<dynamic> data)
      : error = null,
        categories = data
            .map(
              (category) => Category.fromJsonMap(
                category as Map<String, dynamic>,
              ),
            )
            .toList();

  CategoryReponse.error(String mesError)
      : error = mesError,
        categories = null;
}
