import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/data/api/exchange_api.dart';
import 'package:ui_money/src/data/model/country_rate_model.dart';
import 'package:ui_money/src/injector.dart';
import 'package:ui_money/src/util/format_util.dart';

class ExchangeRateController extends GetxController {
  bool isloaded = false;
  final _exchangeData = si<ExchangeRemoteData>();
  List<CountryRateModel> countryRateData = [];
  Rx<CountryRateModel> countrySelect1 = CountryRateModel().obs;
  Rx<TextEditingController> amountController =
      TextEditingController(text: "").obs;
  Rx<TextEditingController> covertAmount = TextEditingController(text: "").obs;

  String errormessage = '';

  @override
  void onInit() {
    onloadData();
    super.onInit();
  }

  Future<void> onloadData() async {
    isloaded = true;
    update();
    final response = await _exchangeData.getCountryRate();
    final isSuccess = response.isSuccess();
    if (isSuccess) {
      countryRateData = response.tryGetSuccess() ?? [];
      countrySelect1.value = countryRateData.first;
      amountController.value.text = '10000.00';
      covertAmount.value.text = countryRateData.first.selling.toString();
    } else {
      errormessage = response.tryGetError() ?? '';
    }
    isloaded = false;
    update();
  }

  void onChangeCountryValue1(double value) async {
    double doublevalue = value / countrySelect1.value.selling;
    covertAmount.value.text = FormatUtil.formatDouble(doublevalue);
  }

  void onChangeCountryValue2(double value) async {
    double doublevalue = value * countrySelect1.value.selling;
    amountController.value.text = FormatUtil.formatDouble(doublevalue);
  }

  void onchangeCountrySelect(CountryRateModel items) async {
    countrySelect1.value = items;
    amountController.value.text = FormatUtil.formatDouble(10000);
    double doublevalue = 10000 / items.selling;
    covertAmount.value.text = FormatUtil.formatDouble(doublevalue);
  }
}
