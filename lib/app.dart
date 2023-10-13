import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:s_fashion/src/config/routes/app_router.dart';
import 'package:s_fashion/src/config/themes/themes.dart';
import 'package:s_fashion/src/localization/l10n.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_bloc.dart';
import 'package:s_fashion/src/modules/detail/logic/images_section/index_image_cubit.dart';
import 'package:s_fashion/src/modules/detail/logic/load_reviews/reviews_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/arrival_product/arrival_product_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/category/category_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/event/event_sale_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/hot_product/hot_product_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/sale_product/sale_product_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/trend_product/trend_product_bloc.dart';
import 'package:s_fashion/src/modules/comon_logics/auth/auth_reponse_cubit.dart';
import 'package:s_fashion/src/modules/comon_logics/localization/set_locale_cubit.dart';
import 'package:s_fashion/src/modules/comon_logics/localization/set_locale_state.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SetLocaleCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => AuthReponseCubit()),
        BlocProvider(create: (context) => EventSaleBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => ArrivalProductBloc()),
        BlocProvider(create: (context) => TrendProductBloc()),
        BlocProvider(create: (context) => SaleProductBloc()),
        BlocProvider(create: (context) => HotProductBloc()),
        BlocProvider(create: (context) => IndexImageCubit()),
        BlocProvider(create: (context) => ReviewsBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: BlocBuilder<SetLocaleCubit, SetLocaleState>(
        builder: (context, localeState) => MaterialApp.router(
          title: 'SFashion',
          debugShowCheckedModeBanner: false,
          theme: XTheme.light(),
          darkTheme: XTheme.dark(),
          routerConfig: _appRouter.config(),
          locale: localeState.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
