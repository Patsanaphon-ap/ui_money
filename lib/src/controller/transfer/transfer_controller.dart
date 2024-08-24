import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/config/route_path.dart';
import 'package:ui_money/src/controller/user/user_controller.dart';
import 'package:ui_money/src/data/api/transfer_api.dart';
import 'package:ui_money/src/data/model/transfer_success_model.dart';
import 'package:ui_money/src/data/model/user_detail_model.dart';
import 'package:ui_money/src/injector.dart';
import 'package:ui_money/src/ui/widget/my_load_widget.dart';
import 'package:ui_money/src/util/format_util.dart';

class TransferController extends GetxController {
  bool isloaded = false;
  Map<String, String> name = {};
  final _transferData = si<TransferRemoteData>();
  String errorMessage = '';

  final TextEditingController toUser = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController note = TextEditingController();

  TransferSuccessModel completeData = TransferSuccessModel();

  void onConfirm() async {
    Get.toNamed(RoutePath.transferconfirm);
  }

  void onSubmit() async {
    final UserDetailModel userdetail = Get.find<UserController>().userDetail;

    double value = double.parse(amount.text);

    Get.dialog(
      barrierDismissible: true,
      PopScope(
        onPopInvoked: (_) => Future.value(true),
        child: const Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyLoadingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 400));
    final response = await _transferData.getTransfer(
      userid: userdetail.userid,
      receiverid: int.parse(toUser.text),
      amount: value,
      description: note.text,
    );
    final isSuccess = response.isSuccess();
    if (isSuccess) {
      completeData = response.tryGetSuccess() ?? TransferSuccessModel();

      Get.find<UserController>().balance.value =
          FormatUtil.formatDouble(completeData.currentbalance);
      Get.toNamed(RoutePath.transfersuccess);
    } else {
      errorMessage = response.tryGetError() ?? '';
    }
  }
}
