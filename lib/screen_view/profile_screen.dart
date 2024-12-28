import 'package:flutter/material.dart';
import '../custom_widget/custom_textstyle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("ProfileScreen")
        ],
      ),
    );
  }
}
