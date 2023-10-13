import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/auth/screen/auth_screen.dart';
import 'package:s_fashion/src/modules/cart/screen/cart_screen.dart';
import 'package:s_fashion/src/modules/detail/screen/detail_screen.dart';
import 'package:s_fashion/src/modules/home/screens/home_screen.dart';
import 'package:s_fashion/src/modules/products/screen/products_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProductsRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: HomeRoute.page, initial: true)
      ];
}
