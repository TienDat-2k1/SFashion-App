import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/utils/utils.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    this.onSelected,
    this.isCurrent = false,
  });

  final String image;
  final double width;
  final double height;
  final Function()? onSelected;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: isCurrent
              ? Border.all(width: 2, color: MyColors.colorOrrage)
              : null,
        ),
        margin: const EdgeInsets.symmetric(vertical: Properties.kPaddingSmall),
        padding: isCurrent ? const EdgeInsets.all(2) : null,
        child: FadeInImage(
          placeholder: const AssetImage(MyImages.imgPlaceHodler),
          image: NetworkImage(Utils.getUrlImageProduct(image)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
