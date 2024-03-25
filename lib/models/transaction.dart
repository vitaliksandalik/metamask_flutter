class Transaction {
  final String date;
  final String type;
  final String status;
  final double amountUsd;
  final double amountEth;

  Transaction({
    required this.date,
    required this.type,
    required this.status,
    required this.amountUsd,
    required this.amountEth,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: json['date'],
      type: json['type'],
      status: json['status'],
      amountUsd: (json['amount_usd'] as num).toDouble(),
      amountEth: (json['amount_eth'] as num).toDouble(),
    );
  }
}
