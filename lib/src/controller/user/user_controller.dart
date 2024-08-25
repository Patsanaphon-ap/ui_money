import 'package:get/get.dart';
import 'package:ui_money/mock/api/mock_user_api.dart';
import 'package:ui_money/src/data/model/user_detail_model.dart';
import 'package:ui_money/src/injector.dart';
import 'package:ui_money/src/util/format_util.dart';

class UserController extends GetxController {
  final _userData = si<MockUserRemoteData>();
  bool isloading = false;
  String errorMessage = '';
  RxString balance = ''.obs;
  UserDetailModel userDetail = UserDetailModel();

  @override
  void onInit() {
    onloadData();
    super.onInit();
  }

  Future<void> onloadData() async {
    isloading = true;
    update();
    final response = await _userData.getUser(userid: 1);
    final isSuccess = response.isSuccess();
    if (isSuccess) {
      userDetail = response.tryGetSuccess() ?? UserDetailModel();
      balance.value = FormatUtil.formatDouble(userDetail.balance);
    } else {
      final error = response.tryGetError();
      errorMessage = error ?? "";
    }
    isloading = false;
    update();
  }
}
