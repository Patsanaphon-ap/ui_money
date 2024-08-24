import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/controller/bottomnav/bottom_nav_controller.dart';
import 'package:ui_money/src/ui/page/home/home_page.dart';
import 'package:ui_money/src/ui/page/option/option_page.dart';
import 'package:ui_money/src/ui/page/wallet/wallet_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with WidgetsBindingObserver {
  final BottomNavController _controller = Get.put(BottomNavController());

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WalletPage(),
    const Text(
      'Index 2: School',
    ),
    OptionPage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            child: BottomNavigationBar(
              useLegacyColorScheme: false,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              iconSize: 32,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_outlined),
                  label: 'wallet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _controller.selectIndex.value,
              onTap: (index) => _controller.onItemTap(index),
            ),
          ),
          body: _widgetOptions.elementAt(_controller.selectIndex.value),
        ));
  }
}
