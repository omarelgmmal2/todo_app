import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String label;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDirection? textDirection;

  const TitleTextWidget({
    super.key,
    required this.label,
    this.textAlign,
    this.maxLines, this.textStyle,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: textDirection,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      label,
      style: textStyle,
    );
  }
}
