import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.borderRadius,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
  });
  final String text;
  final BorderRadius? borderRadius;
  final Color textColor;
  final Color backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius ??
                BorderRadiusGeometry.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
          ),
        ),
        child: Text(text, style: Styles.textStyle18.copyWith(color: textColor)),
      ),
    );
  }
}
