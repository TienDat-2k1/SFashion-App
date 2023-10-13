import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_bloc.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_event.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_state.dart';
import 'package:s_fashion/src/modules/home/screens/splash_screen.dart';
import 'package:s_fashion/src/modules/products/screen/products_screen.dart';
import 'package:s_fashion/src/repositories/sql_query/sql_query.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartBloc>(context).add(const LoadingGetCartEvent());
  }

  @override
  void dispose() {
    SqlQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is LoadingGetCart) {
          return const SplashScreen();
        }

        return const ProductsScreen();
      },
    );
  }
}
