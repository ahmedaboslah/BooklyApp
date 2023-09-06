import 'package:bookly/core/Util/Style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.TextColor,
      this.borderRadius,
      required this.text,
      this.fontsize, this.onPressed});
  final String text;
  final Color backgroundColor;
  final Color TextColor;
  final BorderRadius? borderRadius;
  final double? fontsize;
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
                borderRadius: borderRadius ?? BorderRadius.circular(12))),
        child: Text(
          text,
          style: Style.TextStyle18.copyWith(
              color: TextColor,
              fontWeight: FontWeight.bold,
              fontSize: fontsize),
        ),
      ),
    );
  }
}
