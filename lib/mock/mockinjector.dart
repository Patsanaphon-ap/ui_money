import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_money/mock/api/mock_exchange_api.dart';
import 'package:ui_money/mock/api/mock_history_api.dart';
import 'package:ui_money/mock/api/mock_transfer_api.dart';
import 'package:ui_money/mock/api/mock_user_api.dart';
import 'package:ui_money/src/data/local/httpclient.dart';

final si = GetIt.instance;

Future<void> mockinitInstance() async {
  const doiTimeOut = 30; //30 seconds
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: doiTimeOut),
    receiveTimeout: const Duration(seconds: doiTimeOut),
    sendTimeout: const Duration(seconds: doiTimeOut),
    receiveDataWhenStatusError: true,
    headers: {'accept': 'application/json', 'content-type': 'application/json'},
  ));

  si.registerLazySingleton<HttpClient>(() => HttpClientImp(dio: si()));

  si.registerLazySingleton<MockUserRemoteData>(
      () => MockUserRemoteDataImp(client: si()));

  si.registerLazySingleton<MockTransferRemoteData>(
      () => MockTrasnferRemoteDataImp(client: si()));

  si.registerLazySingleton<MockExchangeRemoteData>(
      () => MockExchangeRemoteDataImp(client: si()));

  si.registerLazySingleton<MockHistoryRemoteData>(
      () => MockHistoryRemoteDataImp(client: si()));

  si.registerLazySingleton(() => dio);
}
