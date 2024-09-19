import 'package:doer_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.onButtonPressed,
    this.label = '',
    this.hasIcon = false,
    this.labelWithIcon,
    this.childVpadding = 10.0,
    this.childHpadding = 10.0,
    this.verticalPadding = 10.0,
    this.fontSize = 17.0,
    this.hasBorder = false,
    this.borderColor,
    this.textColor = Colors.white,
    this.horizontalPadding = 10.0,
    this.radius = 2,
    this.backgroundColor = WebAppColors.primary,
    this.overlayColor,
  });

  final VoidCallback? onButtonPressed;
  final String label;
  final bool? hasIcon;
  final Widget? labelWithIcon;
  final double? childVpadding;
  final double? childHpadding;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? fontSize;
  final bool? hasBorder;
  final Color? borderColor;
  final Color? textColor;
  final Color? overlayColor;
  final double? radius;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!, vertical: verticalPadding!),
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ButtonStyle(
            overlayColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.pressed)) {
                return WebAppColors.white;
              }
              return WebAppColors.primary;
            }),
            textStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
              if (states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.pressed)) {
                return const TextStyle();
              }
              return const TextStyle();
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.pressed)) {
                return WebAppColors
                    .primary; // Change to your desired text color on hover/press
              }
              return Colors.white; // Default text color
            }),
            backgroundColor: WidgetStateProperty.all(backgroundColor),
            // overlayColor:
            //     MaterialStateProperty.all(hasBorder! ? overlayColor : null),
            shape: !hasBorder!
                ? WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius!)))
                : WidgetStateProperty.all(RoundedRectangleBorder(
                    side: BorderSide(color: borderColor!),
                    borderRadius: BorderRadius.circular(radius!)))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: childVpadding!, horizontal: childHpadding!),
          child: hasIcon!
              ? labelWithIcon
              : Text(
                  label,
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
