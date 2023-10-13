import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Text(
            'SFashion',
            style: Style.styleLogo.copyWith(
              fontSize: 44,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
      ),
    );
  }
}
