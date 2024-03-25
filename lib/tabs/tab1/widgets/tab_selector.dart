import 'package:flutter/material.dart';
import 'nft_tab.dart';
import 'balance_info.dart';
import 'token_list.dart';
import '../../../app_colors.dart';

class TabSelector extends StatefulWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 0
                              ? AppColors.blue
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Tokens',
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedIndex == 0
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 1
                              ? AppColors.blue
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'NFTs',
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedIndex == 1
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _selectedIndex == 0
            ? const Column(
                children: [
                  BalanceInfoWidget(),
                  TokenListWidget(),
                ],
              )
            : const Column(
                children: [NFTTab()],
              ),
      ],
    );
  }
}
