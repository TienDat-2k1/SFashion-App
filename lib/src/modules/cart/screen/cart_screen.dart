import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:s_fashion/src/config/routes/app_router.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/order.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/cart/logic/orders_provider.dart';
import 'package:s_fashion/src/modules/cart/widgets/order_item.dart';
import 'package:s_fashion/src/modules/cart/widgets/total_bar.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_bloc.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_event.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_state.dart';
import 'package:s_fashion/src/widgets/dialog_confirm.dart';
import 'package:s_fashion/src/widgets/submit_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(Properties.kPaddingSmall),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            final orders = state.orders;

            void removeOrder(int index) async {
              await showDialog(
                context: context,
                builder: (context) => DialogConfirm(
                  title: AppLocalizations.of(context)!.confirm_remove,
                  subtitle: AppLocalizations.of(context)!.mes_confirm_remove,
                  onCancle: () => context.router.pop(),
                  onConfirm: () {
                    BlocProvider.of<CartBloc>(context).add(
                      RemoveCartEvent(index: index),
                    );
                    context.router.pop();
                  },
                ),
              );
            }

            void onSelectProduct(Product product) {
              context.router.push(DetailRoute(
                product: product,
                isShowActionBar: false,
              ));
            }

            if (orders.isEmpty) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.empty_cart,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              );
            }

            final ordersProvider = OrdersProvider(orders);
            return ChangeNotifierProvider<OrdersProvider>.value(
              value: ordersProvider,
              builder: (context, child) => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider<Order>.value(
                        value: orders[index],
                        builder: (context, child) {
                          return OrderItem(
                            key: UniqueKey(),
                            order: orders[index],
                            onIncrease: () {
                              orders[index].increaseAmount();
                              ordersProvider.setOrders(orders);
                            },
                            onDescrease: () {
                              orders[index].descreaseAmount();
                              ordersProvider.setOrders(orders);
                            },
                            delOrder: () => removeOrder(index),
                            onInfo: () => onSelectProduct(
                              orders[index].product,
                            ),
                          );
                        },
                      ),
                      itemCount: orders.length,
                    ),
                  ),
                  const SizedBox(height: Properties.kPaddingLarge),
                  Column(
                    children: [
                      Consumer<OrdersProvider>(
                        builder: (context, value, child) => TotalBar(
                          price: value.total,
                        ),
                      ),
                      const SizedBox(height: Properties.kPaddingSmall),
                      SubmitButton(
                        title: AppLocalizations.of(context)!.buy_now,
                        height: 60,
                        onClick: () {},
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
