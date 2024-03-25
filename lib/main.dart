import 'package:flutter/material.dart';
import './widgets/footer.dart';
import './widgets/header.dart';
import './widgets/account_details.dart';
import './widgets/tab_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HeaderWidget(),
              AccountDetailsWidget(),
              TabSelector(),
            ],
          ),
        ),
        bottomNavigationBar: FooterWidget(),
      ),
    );
  }
}
