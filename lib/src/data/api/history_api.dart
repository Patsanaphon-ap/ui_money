import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/history_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class HistoryRemoteData {
  Future<Result<List<HistoryModel>, String>> getHistory(
      {required int sendid, required int page});
}

class HistoryRemoteDataImp extends HistoryRemoteData {
  final HttpClient client;
  HistoryRemoteDataImp({required this.client});

  @override
  Future<Result<List<HistoryModel>, String>> getHistory(
      {required int sendid, required int page}) async {
    Map<String, int> data = {"keyword": sendid, "page": page, "limit": 10};

    ResponseResult resp = await client.post(
      '${Environment.apiUrl}/exchange/history',
      data: data,
    );
    if (resp.status) {
      return Success(
        List<HistoryModel>.from(
          (resp.data ?? []).map(
            (e) => HistoryModel.fromJson(e),
          ),
        ),
      );
    }
    return Error(resp.message);
  }
}
