import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/history_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class MockHistoryRemoteData {
  Future<Result<List<HistoryModel>, String>> getHistory(
      {required int sendid, required int page});
}

class MockHistoryRemoteDataImp extends MockHistoryRemoteData {
  final HttpClient client;
  MockHistoryRemoteDataImp({required this.client});

  @override
  Future<Result<List<HistoryModel>, String>> getHistory(
      {required int sendid, required int page}) async {
    Map<String, int> data = {"keyword": sendid, "page": page, "limit": 10};
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    // Load the mock JSON data from the assets
    String jsonString = await rootBundle.loadString('assets/json/history.json');

    // Parse the JSON string into a Map
    final Map<String, dynamic> mockResponse = jsonDecode(jsonString);

    // Setup the mock response
    dioAdapter.onPost('${Environment.apiUrl}/exchange/history',
        (server) => server.reply(200, mockResponse),
        data: data);

    // Make the actual request
    Response res =
        await dio.post('${Environment.apiUrl}/exchange/history', data: data);
    ResponseResult resp = ResponseResult(
        code: res.statusCode ?? 200,
        status: true,
        data: res.data['data'],
        message: res.statusMessage ?? '');

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
