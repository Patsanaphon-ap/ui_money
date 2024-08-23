class TransferSuccessModle {
  int sendid;
  String sendName;
  int receiverid;
  String receiverName;
  int sendamount;
  double currentbalance;

  TransferSuccessModle({
     this.sendid = 0,
     this.sendName = '',
     this.receiverid = 0,
     this.receiverName = '',
     this.sendamount = 0,
     this.currentbalance = 0,
  });

  factory TransferSuccessModle.fromJson(Map<String, dynamic> json) {
    double balance = 0.0;
    if (json['current'] is String) {
      balance = double.tryParse(json['current']) ?? 0.0;
    } else if (json['current'] is int) {
      balance = json['current'].toDouble();
    } else if (json['current'] is double) {
      balance = json['current'];
    } else {
      balance = 0.0;
    }
    return TransferSuccessModle(
      sendid: json['sendid'] ?? 0,
      sendName: json['sendName'] ?? '',
      receiverid: json['receiverid'] ?? '',
      receiverName: json['receiverName'] ?? '',
      sendamount: json['sendamount'] ?? '',
      currentbalance: balance,
    );
  }
}
