import 'package:flutter/material.dart';
import '../tab1/widgets/header.dart';
import '../tab1/widgets/account_details.dart';
import '../tab1/widgets/tab_selector.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(),
            AccountDetailsWidget(),
            TabSelector(),
          ],
        ),
      ),
    );
  }
}
