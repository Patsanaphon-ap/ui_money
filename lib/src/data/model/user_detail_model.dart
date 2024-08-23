class UserDetailModel {
  int userid;
  String firstName;
  String lastName;
  String mobilephone;
  double balance;

  UserDetailModel({
    this.userid = 0,
    this.firstName = '',
    this.lastName = '',
    this.mobilephone = '',
    this.balance = 0.00,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    double balance = 0.0;
    if (json['balance'] is String) {
      balance = double.tryParse(json['balance']) ?? 0.0;
    } else if (json['balance'] is int) {
      balance = json['balance'].toDouble();
    } else if (json['balance'] is double) {
      balance = json['balance'];
    } else {
      balance = 0.0;
    }
    return UserDetailModel(
      userid: json['userid'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      mobilephone: json['mobilephone'] ?? '',
      balance: balance,
    );
  }
}
