import 'package:flutter/material.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    super.key,
    this.onPressed,
    required this.nameButton,
    this.fontSize = 16,
    this.color, this.fontWeight,
  });

  final void Function()? onPressed;
  final String nameButton;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.nameButton,
        style: TextStyle(
          // decorationColor: config!.error,
          color: widget.color ?? AppTheme.primaryColor,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
