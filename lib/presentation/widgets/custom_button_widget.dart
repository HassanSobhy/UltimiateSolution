import 'package:flutter/material.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? height;
  final double? width;
  final double borderWidth;
  final double buttonBorderRadius;
  final FontWeight fontWeight;
  final TextStyle? textStyle;

  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    this.textColor = ColorManager.white,
    this.height = 44,
    this.width,
    this.borderWidth = 1,
    this.buttonBorderRadius = 22,
    this.fontWeight = FontWeight.w500,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                  letterSpacing: 0.24,
                  fontWeight: fontWeight,
                ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: textStyle ??
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: textColor,
                    letterSpacing: 0.24,
                    fontWeight: fontWeight,
                  ),
        ),
      ),
    );
  }
}
