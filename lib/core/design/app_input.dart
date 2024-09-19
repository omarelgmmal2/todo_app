import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool readOnly;
  final Widget? prefixIcon,suffixIcon;
  final TextInputType? type;
  final Function(String)? onChanged;
  final double paddingBottom, paddingTop;
  final FormFieldValidator<String?>? validator;
  final Function(String)? onFieldSubmitted;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const AppInput({
    super.key,
    this.validator,
    this.controller,
    required this.hintText,
    this.paddingBottom = 16,
    this.paddingTop = 0,
    this.type,
    this.onChanged,
    this.prefixIcon,
    this.textStyle,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction, this.suffixIcon,
    this.readOnly = false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: widget.paddingBottom, top: widget.paddingTop),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        keyboardType: widget.type,
        readOnly: widget.readOnly,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.textStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
