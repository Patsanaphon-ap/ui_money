import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/user/user_controller.dart';
import 'package:ui_money/src/ui/page/home/widget/my_balance.dart';
import 'package:ui_money/src/ui/page/home/widget/transfer_widget.dart';
import 'package:ui_money/src/ui/widget/my_appbar.dart';
import 'package:ui_money/src/ui/widget/my_load_widget.dart';
import 'package:ui_money/src/ui/widget/my_page.dart';

/// Displays a list of SampleItems.
class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (_) {
        if (userController.isloading) {
          return const Center(
            child: MyLoadingWidget(),
          );
        } else if (userController.errorMessage != '') {
          return Container();
        }
        return MyPage(
          child: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    MyAppbar(
                      title: 'Hi, Welcome',
                      subtitle:
                          '${userController.userDetail.firstName} ${userController.userDetail.lastName}',
                    ),
                    BalanceWidget(),
                    const TransferWidget(),

                    // LocationWidget(),
                    // const MenuWidget(),
                    // DiscountWidget(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
