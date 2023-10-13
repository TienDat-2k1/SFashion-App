import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/product.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadingGetCartEvent extends CartEvent {
  const LoadingGetCartEvent();
}

class LoadedCartEvent extends CartEvent {
  const LoadedCartEvent();
}

class AddCartEvent extends CartEvent {
  final Product product;
  final int amount;
  final String size;

  const AddCartEvent({
    required this.product,
    required this.amount,
    required this.size,
  });
}

class RemoveCartEvent extends CartEvent {
  final int index;

  const RemoveCartEvent({
    required this.index,
  });
}
