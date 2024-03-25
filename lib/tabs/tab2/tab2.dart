import 'package:flutter/material.dart';
import 'package:metamask_flutter/tabs/tab2/widgets/transactions_list.dart';
import './widgets/header.dart';

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [HeaderWidget(), Expanded(child: TransactionsListWidget())],
        ),
      ),
    );
  }
}
