import 'package:flutter/material.dart';
import '../app_colors.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Clock',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.swap_vert_circle,
                size: 40,
                color: AppColors.blue,
              ),
              label: 'Arrow',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Compass',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.darkGrey,
          onTap: _onItemTapped,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
        ));
  }
}
