import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/repositories/sql_query/sql_query.dart';

class Order extends ChangeNotifier {
  final Product product;
  int amount;
  final String size;

  Order({
    required this.product,
    required this.amount,
    required this.size,
  });

  double getSumPrice() {
    return (product.price * amount * (100 - product.saleOff) / 100).toDouble();
  }

  Future<void> increaseAmount() async {
    if (amount <= 19) {
      final db = await SqlQuery.getInstance();
      final result = await db.updateOrder(copyWith(amount: amount + 1));

      if (result) {
        amount += 1;
        notifyListeners();
      }
    }
  }

  Future<void> descreaseAmount() async {
    if (amount > 1) {
      final db = await SqlQuery.getInstance();
      final result = await db.updateOrder(copyWith(amount: amount - 1));

      if (result) {
        amount -= 1;
        notifyListeners();
      }
    }
  }

  Order copyWith({Product? product, int? amount, String? size}) {
    return Order(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      size: size ?? this.size,
    );
  }
}
