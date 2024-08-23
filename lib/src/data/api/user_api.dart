import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/user_detail_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class UserRemoteData {
  Future<Result<UserDetailModel, String>> getUser({required int userid});
}

class UserRemoteDataImp extends UserRemoteData {
  final HttpClient client;
  UserRemoteDataImp({required this.client});

  @override
  Future<Result<UserDetailModel, String>> getUser({required int userid}) async {
    Map<String, dynamic> data = {
      "userid": userid,
    };
    ResponseResult resp = await client.post(
      '${Environment.apiUrl}/profile/user',
      data: data,
    );

    if (resp.status) {
      return Success(
        UserDetailModel.fromJson(resp.data),
      );
    }
    return Error(resp.message);
  }
}
