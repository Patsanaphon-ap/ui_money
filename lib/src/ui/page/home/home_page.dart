import 'package:flutter/material.dart';
import 'package:ui_money/src/ui/page/home/widget/my_balance.dart';
import 'package:ui_money/src/ui/page/home/widget/transfer_widget.dart';
import 'package:ui_money/src/ui/widget/my_appbar.dart';
import 'package:ui_money/src/ui/widget/my_page.dart';

/// Displays a list of SampleItems.
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyPage(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: const [
            Column(
              children: [
                MyAppbar(
                  title: 'Hi, Welcome',
                  subtitle: "Hey, Let's Order some thing!",
                ),
                BalanceWidget(),
                TransferWidget(),

                // LocationWidget(),
                // const MenuWidget(),
                // DiscountWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
