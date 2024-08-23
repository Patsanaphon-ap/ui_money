import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/transfer/transfer_controller.dart';
import 'package:ui_money/src/ui/page/transfer/widget/amount_widget.dart';
import 'package:ui_money/src/ui/page/transfer/widget/description_widget.dart';
import 'package:ui_money/src/ui/page/transfer/widget/from_widget.dart';
import 'package:ui_money/src/ui/page/transfer/widget/to_widget.dart';
import 'package:ui_money/src/ui/widget/my_appbar.dart';
import 'package:ui_money/src/ui/widget/my_page.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class TransferPage extends StatelessWidget {
  TransferPage({super.key});
  final TransferController transferController = Get.put(TransferController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: MyPage(
        bottomNavigationBar: _bottomNav(context),
        appbar: const MyAppbarDefault(
          title: 'Transfer',
        ),
        child: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FromTransferWidget(),
                  ToTransferWidget(
                    controller: transferController,
                  ),
                  AmountWidget(controller: transferController),
                  DescriptionWidget(controller: transferController),
                ],
              ),
            ],
          ),
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
                    transferController.onConfirm();
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
