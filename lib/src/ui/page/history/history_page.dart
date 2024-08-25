import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/config/constants/app_const.dart';
import 'package:ui_money/src/controller/history/history_controller.dart';
import 'package:ui_money/src/ui/widget/my_page.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final HistoryController historyCtrl = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      useScroll: false,
      appbar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: text24Bold('History'),
      ),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.currency_exchange_outlined,
                                  size: 32,
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        text16Normal(historyCtrl
                                            .historydata[index]
                                            .transactionDate
                                            .day
                                            .toString()),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        text16Normal(AppConst.monthEn[
                                            historyCtrl.historydata[index]
                                                .transactionDate.month]),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        text16Normal(
                                          historyCtrl.historydata[index]
                                              .transactionDate.year
                                              .toString(),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        text16Normal(
                                          historyCtrl.historydata[index]
                                              .transactionDate.hour
                                              .toString(),
                                        ),
                                        text16Normal(":"),
                                        text16Normal(
                                          historyCtrl.historydata[index]
                                              .transactionDate.minute
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        text16Normal("FROM"),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        text18Bold(historyCtrl
                                            .historydata[index].senderId
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        text16Normal("TO"),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        text18Bold(historyCtrl
                                            .historydata[index].receiverId
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            text18Bold(historyCtrl.historydata[index].amount
                                .toString()),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: historyCtrl.historydata.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
