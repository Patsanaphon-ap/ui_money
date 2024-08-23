import 'package:flutter/material.dart';
import 'package:ui_money/src/controller/transfer/transfer_controller.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';
import 'package:ui_money/src/ui/widget/my_textfield.dart';

class ToTransferWidget extends StatelessWidget {
  const ToTransferWidget({super.key, required this.controller});
  final TransferController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text18Bold('To'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text18Bold('ACCOUNT'),
                MyTextField(
                  controller: controller.toUser,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
