import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/transfer_success_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class MockTransferRemoteData {
  Future<Result<Map<String, String>, String>> getPreConfirm({
    required int receiverid,
  });
  Future<Result<TransferSuccessModel, String>> getTransfer({
    required int userid,
    required int receiverid,
    required double amount,
    required String description,
  });
}

class MockTrasnferRemoteDataImp extends MockTransferRemoteData {
  final HttpClient client;
  MockTrasnferRemoteDataImp({required this.client});

  @override
  Future<Result<Map<String, String>, String>> getPreConfirm(
      {required int receiverid}) async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    // Load the mock JSON data from the assets
    String jsonString =
        await rootBundle.loadString('assets/json/receiver.json');

    // Parse the JSON string into a Map
    final Map<String, dynamic> mockResponse = jsonDecode(jsonString);

    Map<String, int> data = {
      "receieveid": receiverid,
    };

    // Setup the mock response
    dioAdapter.onPost(
      '${Environment.apiUrl}/money/receiverprofile',
      (server) => server.reply(200, mockResponse),
      data: data, // Mocking the request with userid
    );

    // Make the actual request
    Response res = await dio.post('${Environment.apiUrl}/money/receiverprofile',
        data: data);
    ResponseResult resp = ResponseResult(
        code: res.statusCode ?? 200,
        status: true,
        data: res.data['data'],
        message: res.statusMessage ?? '');

    // Map<String, int> data = {
    //   "receieveid": receiverid,
    // };
    // ResponseResult resp = await client.post(
    //   '${Environment.apiUrl}/money/receiverprofile',
    //   data: data,
    // );
    if (resp.status) {
      return Success(resp.data);
    }
    return Error(resp.message);
  }

  @override
  Future<Result<TransferSuccessModel, String>> getTransfer({
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

    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    // Load the mock JSON data from the assets
    String jsonString =
        await rootBundle.loadString('assets/json/transfer.json');

    // Parse the JSON string into a Map
    final Map<String, dynamic> mockResponse = jsonDecode(jsonString);

    // Setup the mock response
    dioAdapter.onPost(
      '${Environment.apiUrl}/money/transfer',
      (server) => server.reply(200, mockResponse),
      data: data, // Mocking the request with userid
    );

    Response res =
        await dio.post('${Environment.apiUrl}/money/transfer', data: data);
    ResponseResult resp = ResponseResult(
        code: res.statusCode ?? 200,
        status: true,
        data: res.data['data'],
        message: res.statusMessage ?? '');

    if (resp.status) {
      return Success(
        TransferSuccessModel.fromJson(resp.data),
      );
    }
    return Error(resp.message);
  }
}
