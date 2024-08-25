class HistoryModel {
  int senderId;
  int receiverId;
  double amount;
  String description;
  DateTime transactionDate;

  HistoryModel({
    this.senderId = 0,
    this.receiverId = 0,
    this.amount = 0.0,
    this.description = '',
    required this.transactionDate,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    double balance = 0.0;
    if (json['amount'] is String) {
      balance = double.tryParse(json['current']) ?? 0.0;
    } else if (json['amount'] is int) {
      balance = json['amount'].toDouble();
    } else if (json['amount'] is double) {
      balance = json['amount'];
    } else {
      balance = 0.0;
    }
    return HistoryModel(
        senderId: json['sender_id'] ?? '',
        receiverId: json['receiver_id'] ?? '',
        amount: balance,
        description: json['description'] ?? '',
        transactionDate:
            DateTime.tryParse(json['transaction_date']) ?? DateTime.now());
  }
}
