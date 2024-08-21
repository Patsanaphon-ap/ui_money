import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/config/route_path.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class TransferWidget extends StatelessWidget {
  const TransferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: const BorderRadius.all(Radius.circular(42)),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed(RoutePath.transfer);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.currency_exchange_outlined),
                  const SizedBox(
                    width: 8,
                  ),
                  text18Normal(
                    'Transfer',
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: 1,
            height: 25,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.paid_outlined),
                const SizedBox(
                  width: 8,
                ),
                text18Normal(
                  'Receive',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
