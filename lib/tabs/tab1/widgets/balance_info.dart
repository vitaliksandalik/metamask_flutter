import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../app_colors.dart';
import 'dart:convert';
import '../../../models/token.dart';

class BalanceInfoWidget extends StatefulWidget {
  const BalanceInfoWidget({super.key});

  @override
  State<BalanceInfoWidget> createState() => _BalanceInfoWidgetState();
}

class _BalanceInfoWidgetState extends State<BalanceInfoWidget> {
  Future<double> _calculateTotalBalance() async {
    final String jsonString = await rootBundle.loadString('assets/tokens.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);

    final List<Token> tokens =
        jsonResponse.map((item) => Token.fromJson(item)).toList();

    double totalBalance =
        tokens.fold(0.0, (sum, item) => sum + (item.price * item.amount));

    return totalBalance;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: _calculateTotalBalance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 20.0, top: 22.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${snapshot.data!.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 29, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.0, vertical: 9.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Portfolio',
                            style:
                                TextStyle(fontSize: 14, color: AppColors.blue),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.launch_rounded,
                            size: 13,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
