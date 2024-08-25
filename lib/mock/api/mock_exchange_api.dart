import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/country_rate_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class MockExchangeRemoteData {
  Future<Result<List<CountryRateModel>, String>> getCountryRate();
}

class MockExchangeRemoteDataImp extends MockExchangeRemoteData {
  final HttpClient client;
  MockExchangeRemoteDataImp({required this.client});

  @override
  Future<Result<List<CountryRateModel>, String>> getCountryRate() async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    // Load the mock JSON data from the assets
    String jsonString =
        await rootBundle.loadString('assets/json/exchange.json');

    // Parse the JSON string into a Map
    final Map<String, dynamic> mockResponse = jsonDecode(jsonString);

    // Setup the mock response
    dioAdapter.onGet(
      '${Environment.apiUrl}/exchange/rate',
      (server) => server.reply(200, mockResponse),
    );

    // Make the actual request
    Response res = await dio.get('${Environment.apiUrl}/exchange/rate');
    ResponseResult resp = ResponseResult(
        code: res.statusCode ?? 200,
        status: true,
        data: res.data['data'],
        message: res.statusMessage ?? '');

    if (resp.status) {
      return Success(
        List<CountryRateModel>.from(
          (resp.data ?? []).map(
            (e) => CountryRateModel.fromJson(e),
          ),
        ),
      );
    }
    return Error(resp.message);
  }
}
