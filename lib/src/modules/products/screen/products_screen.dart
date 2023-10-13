import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/config/routes/app_router.dart';
import 'package:s_fashion/src/config/themes/styles.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/products/logic/arrival_product/arrival_product_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/arrival_product/arrival_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/arrival_product/arrival_product_state.dart';
import 'package:s_fashion/src/modules/products/logic/category/category_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/category/category_event.dart';
import 'package:s_fashion/src/modules/products/logic/category/category_state.dart';
import 'package:s_fashion/src/modules/products/logic/event/event_sale_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/event/event_sale_event.dart';
import 'package:s_fashion/src/modules/products/logic/event/event_sale_state.dart';
import 'package:s_fashion/src/modules/products/logic/hot_product/hot_product_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/hot_product/hot_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/hot_product/hot_product_state.dart';
import 'package:s_fashion/src/modules/products/logic/sale_product/sale_product_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/sale_product/sale_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/sale_product/sale_product_state.dart';
import 'package:s_fashion/src/modules/products/logic/trend_product/trend_product_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/trend_product/trend_product_event.dart';
import 'package:s_fashion/src/modules/products/logic/trend_product/trend_product_state.dart';
import 'package:s_fashion/src/modules/products/widgets/ui/action_bar.dart';
import 'package:s_fashion/src/modules/products/widgets/event_sale/event_sale_slide.dart';
import 'package:s_fashion/src/modules/products/widgets/list_categories/list_categories.dart';
import 'package:s_fashion/src/modules/products/widgets/list_products/list_products.dart';
import 'package:s_fashion/src/modules/products/widgets/list_products/list_special_products.dart';
import 'package:s_fashion/src/widgets/loading_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EventSaleBloc>(context).add(const StartLoadEvent());
    BlocProvider.of<ArrivalProductBloc>(context)
        .add(const LoadArrivalProducEvent());
    BlocProvider.of<CategoryBloc>(context).add(const LoadCategoriesEvent());
    BlocProvider.of<TrendProductBloc>(context)
        .add(const LoadTrendProducEvent());
    BlocProvider.of<SaleProductBloc>(context).add(const LoadSaleProducEvent());
    BlocProvider.of<HotProductBloc>(context).add(const LoadHotProducEvent());

    void navigateAuthScreen() {
      context.router.push(const AuthRoute());
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        elevation: 0,
        title: TextButton(
          onPressed: navigateAuthScreen,
          child: Text(
            'SFashion',
            style: Style.styleLogo.copyWith(
              fontSize: 23,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
        actions: const [ActionBar()],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            bottom: Properties.kPaddingSmall,
          ),
          child: Column(
            children: [
              _buildEventSaleSlide(),
              _buildCategoiesList(),
              _buildSaleProduct(),
              _buildTrendProduct(),
              _buildArrivalProduct(),
              _buildHotProduct(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildEventSaleSlide() {
  return BlocBuilder<EventSaleBloc, EventSaleState>(
    builder: (context, state) {
      if (state is LoadingEventState) {
        return const LoadingPage();
      }

      // If have event sales
      if (state is LoadedEventState) {
        final events = state.reponse!.events;
        if (events!.isNotEmpty) {
          return EventSaleSlide(
            events: events,
          );
        }
      }

      // If have error or list is empty with not show event's slide
      return Container();
    },
  );
}

Widget _buildCategoiesList() {
  return BlocBuilder<CategoryBloc, CategoryState>(
    builder: (context, state) {
      if (state is LoadingCategoryState) {
        return const LoadingPage();
      }

      // If have event sales
      if (state is LoadedCategoryState) {
        final categories = state.reponse!.categories;
        if (categories!.isNotEmpty) {
          return LiistCategories(
            title: AppLocalizations.of(context)!.category.toUpperCase(),
            categories: categories,
          );
        }
      }

      // If have error or list is empty with not show categories list
      return Container();
    },
  );
}

Widget _buildArrivalProduct() {
  return BlocBuilder<ArrivalProductBloc, ArrivalProductState>(
    builder: (context, state) {
      if (state is LoadingArrivalProductState) {
        return const LoadingPage();
      }

      // If have arrival products
      if (state is LoadedArrivalProductState) {
        var arrivals = state.reponse!.products;
        if (arrivals!.isNotEmpty) {
          arrivals = arrivals.sublist(0, 10);
          return ListProducts(
            title: AppLocalizations.of(context)!.arrival_products.toUpperCase(),
            products: arrivals,
          );
        }
      }

      // If have error or list is empty with not show arrival products
      return Container();
    },
  );
}

Widget _buildTrendProduct() {
  return BlocBuilder<TrendProductBloc, TrendProductState>(
    builder: (context, state) {
      if (state is LoadingTrendProductState) {
        return const LoadingPage();
      }

      // If have arrival products
      if (state is LoadedTrendProductState) {
        var trends = state.reponse!.products;
        if (trends!.isNotEmpty) {
          trends = trends.sublist(0, 10);
          return ListProducts(
            title: AppLocalizations.of(context)!.trend_products.toUpperCase(),
            products: trends,
          );
        }
      }

      // If have error or list is empty with not show trend products
      return Container();
    },
  );
}

Widget _buildSaleProduct() {
  return BlocBuilder<SaleProductBloc, SaleProductState>(
    builder: (context, state) {
      if (state is LoadingSaleProductState) {
        return const LoadingPage();
      }

      // If have arrival products
      if (state is LoadedSaleProductState) {
        var sales = state.reponse!.products;
        if (sales!.isNotEmpty) {
          sales = sales.sublist(0, 10);
          return ListSpecialProdcuts(
            title: AppLocalizations.of(context)!.sale_products.toUpperCase(),
            products: sales,
            description: 'Temp text for descriptions',
          );
        }
      }

      // If have error or list is empty with not show sale products
      return Container();
    },
  );
}

Widget _buildHotProduct() {
  return BlocBuilder<HotProductBloc, HotProductState>(
    builder: (context, state) {
      if (state is LoadingHotProductState) {
        return const LoadingPage();
      }

      // If have arrival products
      if (state is LoadedHotProductState) {
        var hots = state.reponse!.products;
        if (hots!.isNotEmpty) {
          hots = hots.sublist(0, 10);
          return ListProducts(
            title: AppLocalizations.of(context)!.hot_products.toUpperCase(),
            products: hots,
          );
        }
      }

      // If have error or list is empty with not show trend products
      return Container();
    },
  );
}
