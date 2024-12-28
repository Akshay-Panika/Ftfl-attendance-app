import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final BoxConstraints? constraints;
  final void Function()? onTap;

  const CustomContainer({
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.alignment,
    this.child,
    this.constraints,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        alignment: alignment,
        decoration: decoration ?? BoxDecoration(), // Default to an empty BoxDecoration
        constraints: constraints,
        child: child,
      ),
    );
  }
}
