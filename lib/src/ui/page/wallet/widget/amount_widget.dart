import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/exchangerate/exchange_rate_controller.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class ExchangeAmountWidget extends StatelessWidget {
  ExchangeAmountWidget({super.key});
  final ExchangeRateController exchangeController =
      Get.put(ExchangeRateController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            text16Normal(
              'Amount',
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            'https://cdn.britannica.com/38/4038-004-111388C2/Flag-Thailand.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  text18Bold('THB'),
                ],
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Obx(
              () {
                return Expanded(
                  child: TextFormField(
                    controller: exchangeController.amountController.value,
                    onChanged: (value) {
                      exchangeController
                          .onChangeCountryValue1(double.tryParse(value) ?? 0.0);
                    },
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
