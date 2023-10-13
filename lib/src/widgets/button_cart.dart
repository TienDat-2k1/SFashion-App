import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/config/routes/app_router.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_bloc.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_state.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateCartScreen() {
      context.router.push(const CartRoute());
    }

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final orders = state.orders;
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: navigateCartScreen,
              icon: const FaIcon(FontAwesomeIcons.cartShopping),
              iconSize: 16,
            ),
            if (orders.isNotEmpty)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.error,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    orders.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
