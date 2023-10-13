import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.isShow = true,
    this.validator,
    this.controller,
    this.focusNode,
    this.onFieldSubmit,
    this.onSaved,
  });

  final String labelText;
  final bool isShow;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmit;
  final Function(String?)? onSaved;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      constraints: BoxConstraints(
        maxHeight: widget.isShow ? 78 : 0,
        minHeight: widget.isShow ? 60 : 0,
      ),
      child: SingleChildScrollView(
        child: TextFormField(
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmit,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            label: Text(
              widget.labelText,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            errorMaxLines: 1,
            hintMaxLines: 1,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
          maxLines: 1,
          obscureText: widget.obscureText,
          validator: widget.validator,
          onSaved: widget.onSaved,
        ),
      ),
    );
  }
}
