import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration customDecoration({
  Color? color,
  Color borderColor = Colors.transparent,
  double borderWidth = 0,
  double borderRadius = 0,
  List<BoxShadow> boxShadow = const [],
  Gradient? gradient,
}) {
  return BoxDecoration(
    color: color,
    border: Border.all(color: borderColor, width: borderWidth),
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: boxShadow,
    gradient:gradient,
  );
}
