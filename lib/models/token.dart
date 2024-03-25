class Token {
  final String name;
  final String logo;
  final double price;
  final String symbol;
  final double amount;

  Token(
      {required this.name,
      required this.logo,
      required this.price,
      required this.symbol,
      required this.amount});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      name: json['name'],
      logo: json['logo'],
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'],
      symbol: json['symbol'],
      amount: (json['amount'] is int)
          ? (json['amount'] as int).toDouble()
          : json['amount'],
    );
  }
}
