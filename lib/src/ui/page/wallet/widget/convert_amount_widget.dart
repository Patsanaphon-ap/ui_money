import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/exchangerate/exchange_rate_controller.dart';
import 'package:ui_money/src/data/model/country_rate_model.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class ConvertAmountWidget extends StatelessWidget {
  ConvertAmountWidget({super.key});

  final ExchangeRateController exchangeController =
      Get.put(ExchangeRateController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            text16Normal(
              'Converted Amount',
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  menuMaxHeight: 300,
                  isDense: false,
                  isExpanded: true,
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
                  ),
                  dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                  // Initial Value
                  value: exchangeController.countrySelect1.value,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: exchangeController.countryRateData
                      .map((CountryRateModel items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Image.network(
                              items.flagPath,
                              height: 45,
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          text18Bold(items.currencyId),
                        ],
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (items) async {
                    exchangeController
                        .onchangeCountrySelect(items ?? CountryRateModel());
                  },
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              Obx(
                () {
                  return Expanded(
                    child: TextFormField(
                      controller: exchangeController.covertAmount.value,
                      onChanged: (value) {
                        exchangeController.onChangeCountryValue2(
                            double.tryParse(value) ?? 0.0);
                      },
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
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
        ),
      ],
    );
  }
}
