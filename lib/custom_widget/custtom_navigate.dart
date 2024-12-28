import 'package:flutter/material.dart';

void customNavigate(BuildContext context, Widget targetScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => targetScreen,
    ),
  );
}
