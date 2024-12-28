import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0.0,
        color:color ?? Colors.white,
        shape:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black54, width: 0.1)
        ),
        child:  Padding(
          padding: padding ?? EdgeInsets.all(0.0),
          child: child,
        ),
      ),
    );
  }
}
