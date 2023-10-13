import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/models/review.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/review_item.dart';
import 'package:s_fashion/src/modules/detail/widgets/ui/button_more.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({
    super.key,
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  bool isExpanded = false;

  void changeModeExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isShowMore = false;

    if (widget.reviews.length >= 3) {
      isShowMore = true;
    }

    return Container(
      padding: const EdgeInsets.only(
        left: Properties.kPaddingSmall,
        right: Properties.kPaddingSmall,
        bottom: Properties.kPaddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isExpanded ? double.infinity : 120,
            constraints: const BoxConstraints(
              maxHeight: 400,
              minHeight: 100,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: widget.reviews
                    .map(
                      (review) => ReviewItem(review: review),
                    )
                    .toList(),
              ),
            ),
          ),
          if (isShowMore)
            ButtonMore(
              text: isExpanded
                  ? AppLocalizations.of(context)!.close
                  : AppLocalizations.of(context)!.more,
              onClick: changeModeExpand,
            ),
        ],
      ),
    );
  }
}
