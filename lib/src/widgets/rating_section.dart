import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:s_fashion/src/constants/properties.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
    required this.point,
    this.size = Properties.sizeStar,
  });

  final double point;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: point,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
