import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/base_url.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.onClick,
  });

  final Category category;

  final Function(Category)? onClick;

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final double widthItem = widthDevice >= 700 ? 170 : 120;
    final double heightItem = widthDevice >= 700 ? 230 : 95;

    return GestureDetector(
      onTap: onClick != null ? () => onClick!(category) : null,
      child: SizedBox(
        width: widthItem,
        height: heightItem,
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Properties.kRadiusMedium),
            child: Stack(
              fit: StackFit.expand,
              children: [
                FadeInImage(
                  placeholder: const AssetImage(MyImages.imgPlaceHodler),
                  image: NetworkImage(
                    BaseUrl.imgCategory + category.imageCover,
                  ),
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, MyColors.colorBlack],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: const EdgeInsets.all(
                    Properties.kPaddingSmall,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
