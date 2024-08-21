import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt selectIndex = 0.obs;

  void onItemTap(int index) {
    selectIndex.value = index;
  }
}
