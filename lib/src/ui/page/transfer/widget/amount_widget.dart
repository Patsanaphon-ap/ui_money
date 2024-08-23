import 'package:flutter/material.dart';
import 'package:ui_money/src/controller/transfer/transfer_controller.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({super.key, required this.controller});
  final TransferController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text18Bold('Amount'),
          TextField(
            controller: controller.amount,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              hintText: '0.00',
              suffixText: 'THB',
            ),
          ),
        ],
      ),
    );
  }
}
