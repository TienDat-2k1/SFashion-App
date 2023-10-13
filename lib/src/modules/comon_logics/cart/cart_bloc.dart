import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/models/order.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_event.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_state.dart';
import 'package:s_fashion/src/repositories/sql_query/sql_query.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const LoadingGetCart()) {
    on<LoadingGetCartEvent>(
      (event, emit) async {
        final db = await SqlQuery.getInstance();
        final orders = await db.readCart();
        emit(LoadedgGetCart(orders: orders));
      },
    );

    on<AddCartEvent>(
      (event, emit) async {
        final index = state.orders.indexWhere((order) =>
            order.product.id == event.product.id && order.size == event.size);

        if (index >= 0) {
          final currentCart = [...state.orders];
          currentCart[index].amount += event.amount;
          emit(LoadedgGetCart(orders: currentCart));
          return;
        }

        final newOrder = Order(
          product: event.product,
          amount: event.amount,
          size: event.size,
        );

        final db = await SqlQuery.getInstance();
        final isSuccess = await db.addCart(newOrder);

        if (isSuccess) {
          final currentCart = [newOrder, ...state.orders];
          emit(LoadedgGetCart(orders: currentCart));
        } else {
          emit(
            ErrorCart(orders: [...state.orders], errorMes: 'Add order failed!'),
          );
        }
      },
    );

    on<RemoveCartEvent>(
      (event, emit) async {
        final currentCart = [...state.orders];

        final db = await SqlQuery.getInstance();
        final isSuccess = await db.removeCart(currentCart[event.index]);

        if (isSuccess) {
          currentCart.removeAt(event.index);
          emit(LoadedgGetCart(orders: currentCart));
        } else {
          emit(
            ErrorCart(orders: currentCart, errorMes: 'Remove order failed!'),
          );
        }
      },
    );
  }
}
