import 'package:ui_money/src/config/constants/app_const.dart';

class CountryRateModel {
  String period;
  String currencyId;
  String countryName;
  String currencyNameTh;
  String currencyNameEng;
  double buyingSight;
  double buyingTransfer;
  double selling;
  String flagPath;

  CountryRateModel({
    this.period = '',
    this.currencyId = '',
    this.countryName = '',
    this.currencyNameTh = '',
    this.currencyNameEng = '',
    this.buyingSight = 0.0,
    this.buyingTransfer = 0.0,
    this.selling = 0.0,
    this.flagPath = '',
  });

  factory CountryRateModel.fromJson(Map<String, dynamic> json) {
    return CountryRateModel(
      period: json['period'] ?? '',
      currencyId: json['currency_id'] ?? '',
      countryName: json['country_name'] ?? '',
      currencyNameTh: json['currency_name_th'] ?? '',
      currencyNameEng: json['currency_name_eng'] ?? '',
      buyingSight: json['buying_sight'] ?? 0.0,
      buyingTransfer: json['buying_transfer'] ?? 0.0,
      selling: json['selling'] ?? 0.0,
      flagPath: AppConst.flagURL + json['flag_path'],
    );
  }
}
