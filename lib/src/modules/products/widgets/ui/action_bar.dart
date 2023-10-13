import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/modules/products/widgets/ui/cart_icon.dart';
import 'package:s_fashion/src/modules/products/widgets/ui/search_input.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({super.key});

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  bool _isExpanded = false;

  /// Change between Expanded and NotExpanded
  void changeMode() {
    // Hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;

    return Row(
      children: [
        // If device is tablet, it will not hide icon cart
        CartIcon(isExpanded: _isExpanded && widthDevice < 700),
        IconButton(
          onPressed: changeMode,
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          iconSize: 16,
        ),
        SearchInput(isExpanded: _isExpanded),
      ],
    );
  }
}
