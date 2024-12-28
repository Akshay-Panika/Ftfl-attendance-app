import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textPaddingWidget({
  required String text,
  EdgeInsetsGeometry? padding,
  TextStyle? textStyle,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.all(2.0), // Default padding
    child: InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle ??
             const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ), // Default text style
        overflow: TextOverflow.clip,
      ),
    ),
  );
}
