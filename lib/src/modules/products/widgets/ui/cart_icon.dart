import 'package:flutter/material.dart';
import 'package:s_fashion/src/widgets/button_cart.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({
    super.key,
    required this.isExpanded,
  });

  final bool isExpanded;

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      constraints: BoxConstraints(
        maxWidth: !widget.isExpanded ? 50 : 0,
        minWidth: !widget.isExpanded ? 50 : 0,
      ),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ButtonCart(),
      ),
    );
  }
}
