import 'package:flutter/material.dart';

import 'custom_textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? bColor;
  final IconThemeData? iconColor;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.bColor,
    this.iconColor,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 0.0,
      titleTextStyle: textStyle18(color: Colors.black, fontWeight: FontWeight.w700),
      backgroundColor: bColor ?? Colors.white,
      iconTheme: iconColor ?? const IconThemeData(color: Colors.black),
      actions: actions,
      leadingWidth: 30,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
