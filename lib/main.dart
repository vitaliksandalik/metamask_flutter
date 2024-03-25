import 'package:flutter/material.dart';
import './widgets/footer.dart';
import './tabs/tab1/tab1.dart';
import './tabs/tab2/tab2.dart';
import './tabs/tab3/tab3.dart';
import './tabs/tab4/tab4.dart';
import './tabs/tab5/tab5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _getCurrentTab() {
    switch (_selectedTabIndex) {
      case 0:
        return const Tab1();
      case 1:
        return const Tab2();

      case 2:
        return const Tab3();
      case 3:
        return const Tab4();
      case 4:
        return const Tab5();
      default:
        return const Tab1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _getCurrentTab()),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
