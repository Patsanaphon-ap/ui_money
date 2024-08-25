import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/exchangerate/exchange_rate_controller.dart';
import 'package:ui_money/src/ui/page/wallet/widget/amount_widget.dart';
import 'package:ui_money/src/ui/page/wallet/widget/convert_amount_widget.dart';
import 'package:ui_money/src/ui/widget/my_load_widget.dart';
import 'package:ui_money/src/ui/widget/my_page.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class WalletPage extends StatelessWidget {
  WalletPage({super.key});

  final ExchangeRateController exchangeController =
      Get.put(ExchangeRateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExchangeRateController>(
      builder: (_) {
        if (exchangeController.isloaded) {
          return const Center(
            child: MyLoadingWidget(),
          );
        }
        return GestureDetector(
          onTap: () => Get.focusScope?.unfocus(),
          child: MyPage(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      text24Bold('Currency Converter'),
                      text18Normal(
                        'Check live rates,set rate alerts, receive notifications and more.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        ExchangeAmountWidget(),
                        const Divider(),
                        ConvertAmountWidget(),
                        Obx(
                          () => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text16Normal(
                                  exchangeController
                                      .countrySelect1.value.currencyNameEng,
                                ),
                                Row(
                                  children: [
                                    text16Normal(
                                      exchangeController
                                          .countrySelect1.value.countryName
                                          .toString(),
                                    ),
                                    text16Normal(' = '),
                                    text16Normal(
                                      exchangeController
                                          .countrySelect1.value.selling
                                          .toString(),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    text16Normal('THB'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        text16Normal("Last Update: "),
                        text16Bold(
                          exchangeController.countrySelect1.value.period
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
