import 'package:flutter/material.dart';
import 'package:metamask_flutter/app_colors.dart';

class Tab5 extends StatelessWidget {
  const Tab5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Coming soon...",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.darkGrey,
        ),
      ),
    );
  }
}
