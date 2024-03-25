import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../models/token.dart';

class TokenListWidget extends StatefulWidget {
  const TokenListWidget({super.key});

  @override
  _TokenListWidgetState createState() => _TokenListWidgetState();
}

class _TokenListWidgetState extends State<TokenListWidget> {
  late Future<List<Token>> _tokens;

  Future<List<Token>> _loadTokens() async {
    final String jsonString = await rootBundle.loadString('assets/tokens.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((item) => Token.fromJson(item)).toList();
  }

  @override
  void initState() {
    super.initState();
    _tokens = _loadTokens();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Token>>(
      future: _tokens,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Container(
              height: 348,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final token = snapshot.data![index];
                  final total = token.price * token.amount;
                  return ListTile(
                    leading: SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            token.logo,
                            width: 35,
                            height: 35,
                          ),
                          Positioned(
                            right: 2,
                            top: -5,
                            child: Image.asset(
                              'assets/logos/eth-1.png',
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      token.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('${token.amount} ${token.symbol}'),
                    trailing: Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
