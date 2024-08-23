import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/transfer_success_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class TransferRemoteData {
  Future<Result<Map<String, String>, String>> getPreConfirm({
    required int receiverid,
  });
  Future<Result<TransferSuccessModle, String>> getTransfer({
    required int userid,
    required int receiverid,
    required double amount,
    required String description,
  });
}

class TrasnferRemoteDataImp extends TransferRemoteData {
  final HttpClient client;
  TrasnferRemoteDataImp({required this.client});

  @override
  Future<Result<Map<String, String>, String>> getPreConfirm(
      {required int receiverid}) async {
    Map<String, int> data = {
      "receieveid": receiverid,
    };
    ResponseResult resp = await client.post(
      '${Environment.apiUrl}/money/receiverprofile',
      data: data,
    );
    if (resp.status) {
      return Success(resp.data);
    }
    return Error(resp.message);
  }

  @override
  Future<Result<TransferSuccessModle, String>> getTransfer({
    required int userid,
    required int receiverid,
    required double amount,
    required String description,
  }) async {
    Map<String, dynamic> data = {
      "sendid": userid,
      "receieveid": receiverid,
      "amount": amount,
      "description": description
    };
    ResponseResult resp = await client.post(
      '${Environment.apiUrl}/money/transfer',
      data: data,
    );

    if (resp.status) {
      return Success(
        TransferSuccessModle.fromJson(resp.data),
      );
    }
    return Error(resp.message);
  }
}
