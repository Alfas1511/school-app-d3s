import 'package:flutter/material.dart';
import 'package:school_app/resources/app_styles.dart';

class ButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Gradient? gradient;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final TextStyle? textStyle;

  const ButtonComponent({
    super.key,
    required this.onPressed,
    required this.label,
    this.gradient,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null
            ? (backgroundColor ?? Theme.of(context).primaryColor)
            : null,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.transparent, // 👈 Transparent to show gradient
          shadowColor: Colors.transparent, // 👈 Remove default shadow color
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        child: Text(
          label,
          style:
              textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
