import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/user/user_controller.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class FromTransferWidget extends StatelessWidget {
  FromTransferWidget({super.key});
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          text18Bold('From'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: SvgPicture.asset('assets/icons/avatar.svg'),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text18Normal('SAVING ACCOUNT'),
                    text18Bold('227-0-xxx393'),
                    Row(
                      children: [
                        Obx(
                          () => text18Bold(userController.balance.value),
                        ),
                        text18Normal('THB')
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
