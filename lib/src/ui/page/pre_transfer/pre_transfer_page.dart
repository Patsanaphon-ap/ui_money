import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/transfer/transfer_controller.dart';
import 'package:ui_money/src/ui/page/transfer/widget/from_widget.dart';
import 'package:ui_money/src/ui/widget/my_appbar.dart';
import 'package:ui_money/src/ui/widget/my_page.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class PreTransferPage extends StatelessWidget {
  PreTransferPage({super.key});

  final TransferController transferController = Get.put(TransferController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      bottomNavigationBar: _bottomNav(context),
      appbar: const MyAppbarDefault(
        title: 'Pre-Transfer',
      ),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FromTransferWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text18Bold('To'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).dividerColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child:
                                  SvgPicture.asset('assets/icons/avatar.svg'),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text18Normal('ACCOUNT'),
                                text18Bold(transferController.toUser.text),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  height: 2,
                ),
                const SizedBox(
                  height: 12,
                ),
                text18Normal(
                  'Amonut',
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text24Bold(transferController.amount.text),
                    const SizedBox(
                      width: 12,
                    ),
                    text18Bold('THB', textAlign: TextAlign.center)
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                text18Normal(
                  'FEE',
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text24Bold('0'),
                    const SizedBox(
                      width: 12,
                    ),
                    text18Bold('THB', textAlign: TextAlign.center)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).padding.bottom + 12,
          top: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    transferController.onSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: text22Bold(
                    'Confirm',
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
