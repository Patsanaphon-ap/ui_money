import 'package:flutter/material.dart';
import 'package:ui_money/src/controller/transfer/transfer_controller.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.controller});

  final TransferController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text18Bold('Note (Optional)'),
          TextField(
            controller: controller.note,
            maxLines: 5,
            maxLength: 255,
            onChanged: (value) {},
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
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
              hintText: 'Reminde',
            ),
          ),
        ],
      ),
    );
  }
}
