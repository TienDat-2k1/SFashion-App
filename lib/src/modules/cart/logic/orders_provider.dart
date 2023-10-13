import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/order.dart';

class OrdersProvider extends ChangeNotifier {
  List<Order> orders;
  double total = 0;

  OrdersProvider(this.orders) {
    total = getTotalPrice(orders);
  }

  double getTotalPrice(List<Order> orders) {
    double sum = 0;

    for (var order in orders) {
      sum += order.getSumPrice();
    }

    return sum;
  }

  void setOrders(List<Order> orders) {
    this.orders = orders;
    total = getTotalPrice(orders);
    notifyListeners();
  }
}
