import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/user_detail_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class MockUserRemoteData {
  Future<Result<UserDetailModel, String>> getUser({required int userid});
}

class MockUserRemoteDataImp extends MockUserRemoteData {
  final HttpClient client;

  MockUserRemoteDataImp({required this.client});

  @override
  Future<Result<UserDetailModel, String>> getUser({required int userid}) async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    // Load the mock JSON data from the assets
    String jsonString = await rootBundle.loadString('assets/json/user.json');

    // Parse the JSON string into a Map
    final Map<String, dynamic> mockResponse = jsonDecode(jsonString);

    // Setup the mock response
    dioAdapter.onPost(
      '${Environment.apiUrl}/profile/user',
      (server) => server.reply(200, mockResponse),
      data: {'userid': userid}, // Mocking the request with userid
    );

    // Make the actual request
    try {
      Response res = await dio
          .post('${Environment.apiUrl}/profile/user', data: {'userid': userid});
      ResponseResult resp = ResponseResult(
          code: res.statusCode ?? 200,
          status: true,
          data: res.data['data'],
          message: res.statusMessage ?? '');

      if (resp.status) {
        return Success(UserDetailModel.fromJson(resp.data));
      } else {
        return Error(resp.message);
      }
    } catch (e) {
      return Error('Failed to fetch user data: ${e.toString()}');
    }
  }
}
