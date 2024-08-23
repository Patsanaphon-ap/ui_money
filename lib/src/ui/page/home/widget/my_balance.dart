import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/user/user_controller.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class BalanceWidget extends StatelessWidget {
  BalanceWidget({super.key});
  final UserController userController = Get.put(UserController());
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
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text32Bold('฿ ${userController.balance.value}'),
                      text24Bold('THB'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
