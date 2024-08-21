import 'package:flutter/material.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin:
                const EdgeInsets.only(bottom: 12, left: 12, right: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text18Normal(
                  'My Balance',
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text32Bold('\$ 80,000.60'),
                    text24Bold('THB'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
