import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/category.dart';
import 'package:s_fashion/src/modules/products/widgets/list_categories/category_item.dart';
import 'package:s_fashion/src/modules/products/widgets/ui/title_sesion.dart';

class LiistCategories extends StatelessWidget {
  const LiistCategories({
    super.key,
    required this.title,
    required this.categories,
  });

  final String title;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: Properties.kPaddingMedium,
        left: Properties.kPaddingSmall,
        right: Properties.kPaddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSesion(title: title),
          const SizedBox(height: Properties.kPaddingSmall),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map(
                    (category) => CategoryItem(
                      category: category,
                      onClick: (category) {
                        // Navigate to filter products
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
