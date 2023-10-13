import 'package:flutter/material.dart';

class ButtonMore extends StatelessWidget {
  const ButtonMore({
    super.key,
    required this.text,
    this.onClick,
  });

  final String text;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
