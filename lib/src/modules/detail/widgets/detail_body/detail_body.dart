import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/detail/logic/load_reviews/reviews_bloc.dart';
import 'package:s_fashion/src/modules/detail/logic/load_reviews/reviews_event.dart';
import 'package:s_fashion/src/modules/detail/logic/load_reviews/reviews_state.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/description_section.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/review_section.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/text_sale.dart';
import 'package:s_fashion/src/modules/detail/widgets/ui/divider_vertical.dart';
import 'package:s_fashion/src/modules/detail/widgets/ui/sizes_bar.dart';
import 'package:s_fashion/src/widgets/loading_page.dart';
import 'package:s_fashion/src/widgets/rating_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
    required this.idProduct,
    required this.nameProduct,
    this.averageProduct = 0,
    this.quantityProduct = 0,
    this.soldProduct = 0,
    required this.material,
    required this.sizes,
    required this.description,
    required this.price,
    required this.saleOff,
  });

  final String idProduct;
  final String nameProduct;
  final double averageProduct;
  final int quantityProduct;
  final int soldProduct;
  final String material;
  final String description;
  final List<String> sizes;
  final double price;
  final double saleOff;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReviewsBloc>(context).add(LoadReviewsEvent(idProduct));

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Properties.kPaddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameProduct,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: Properties.kPaddingSmall),
          Row(
            children: [
              RatingSection(point: averageProduct),
              const SizedBox(width: Properties.kPaddingSmall),
              Text(
                averageProduct.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ],
          ),
          const SizedBox(height: Properties.kPaddingSmall),
          Row(
            children: [
              Text(
                '${AppLocalizations.of(context)!.amount}: $quantityProduct',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              DividerVertical(
                height: 14,
                color: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              Text(
                '${AppLocalizations.of(context)!.sold}: $quantityProduct',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              DividerVertical(
                height: 14,
                color: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              Text(
                '${AppLocalizations.of(context)!.material}: $material',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: Properties.kPaddingMedium),
          SizesBar(sizes: sizes),
          const SizedBox(height: Properties.kPaddingMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextSale(
                price: price,
                saleOff: saleOff,
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.heart,
                  size: Properties.sizeIconButton,
                ),
              ),
            ],
          ),
          const SizedBox(height: Properties.kPaddingLarge),
          DescriptionSection(description: description),
          const SizedBox(height: Properties.kPaddingMedium),
          Text(
            '${AppLocalizations.of(context)!.review}:',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          BlocBuilder<ReviewsBloc, ReviewsState>(
            builder: (context, state) {
              if (state is LoadingReviewsState) {
                return const LoadingPage();
              }

              if (state is LoadedReviewsState) {
                var reviews = state.reponse!.reviews;
                if (reviews!.isNotEmpty) {
                  return ReviewSection(reviews: reviews);
                } else {
                  return Text(
                    'Empty reviews',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                  );
                }
              }

              return Container();
            },
          ),
          const SizedBox(height: Properties.kPaddingMedium),
        ],
      ),
    );
  }
}
