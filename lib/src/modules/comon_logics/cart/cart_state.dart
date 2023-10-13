import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/order.dart';

class CartState extends Equatable {
  final List<Order> orders;

  const CartState({required this.orders});

  @override
  List<Object?> get props => [orders, UniqueKey()];
}

class LoadingGetCart extends CartState {
  const LoadingGetCart() : super(orders: const []);
}

class LoadedgGetCart extends CartState {
  const LoadedgGetCart({required List<Order> orders}) : super(orders: orders);
}

class ErrorCart extends CartState {
  final String errorMes;

  const ErrorCart({required List<Order> orders, required this.errorMes})
      : super(orders: orders);
}
