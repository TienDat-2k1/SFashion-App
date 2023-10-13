import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Properties.kPaddingLarge),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
