import 'package:get/get.dart';
import 'package:ui_money/src/data/api/history_api.dart';
import 'package:ui_money/src/data/model/history_model.dart';
import 'package:ui_money/src/injector.dart';

class HistoryController extends GetxController {
  bool isloaded = false;
  String errormessage = '';
  List<HistoryModel> historydata = [];
  int page = 1;
  final _historyData = si<HistoryRemoteData>();

  @override
  void onInit() {
    onloadData();
    super.onInit();
  }

  Future<void> onloadData() async {
    isloaded = true;
    update();
    final response = await _historyData.getHistory(sendid: 1, page: page);
    final isSuccess = response.isSuccess();
    if (isSuccess) {
      historydata = response.tryGetSuccess() ?? [];
    } else {
      errormessage = response.tryGetError() ?? '';
    }
    isloaded = false;
    update();
  }
}
