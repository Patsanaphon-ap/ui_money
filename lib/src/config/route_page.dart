import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/ui/page/home/home_page.dart';
import 'package:ui_money/src/ui/page/pre_transfer/pre_transfer_page.dart';
import 'package:ui_money/src/ui/page/pre_transfer/success/transfer_success.dart';
import 'package:ui_money/src/ui/page/transfer/transfer_page.dart';
import 'package:ui_money/src/ui/page/wallet/wallet_page.dart';
import 'package:ui_money/src/ui/widget/my_bottom_nav.dart';

import 'route_path.dart';

class RoutePages {
  RoutePages._();

  static final routes = [
    GetPage(
        name: RoutePath.pageNotfound,
        page: () =>
            const Scaffold(body: Center(child: Text('Page Not Found.')))),
    GetPage(
      name: RoutePath.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RoutePath.wallet,
      page: () => WalletPage(),
    ),
    GetPage(
      name: RoutePath.transfer,
      page: () => TransferPage(),
    ),
    GetPage(
      name: RoutePath.transferconfirm,
      page: () => PreTransferPage(),
    ),
    GetPage(
      name: RoutePath.transfersuccess,
      page: () => TransferSuccessPage(),
    ),
    GetPage(
      name: RoutePath.bottomnav,
      page: () => const BottomNavBar(),
    ),
  ];
}
