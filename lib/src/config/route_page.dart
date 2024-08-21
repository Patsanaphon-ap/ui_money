import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/ui/page/home/home_page.dart';
import 'package:ui_money/src/ui/page/transfer/transfer_page.dart';
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
      page: () => const HomePage(),
    ),
    GetPage(
      name: RoutePath.transfer,
      page: () => const TransferPage(),
    ),
    GetPage(
      name: RoutePath.bottomnav,
      page: () => const BottomNavBar(),
    ),
  ];
}
