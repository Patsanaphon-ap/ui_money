import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_money/src/data/api/transfer_api.dart';
import 'package:ui_money/src/data/api/user_api.dart';
import 'package:ui_money/src/data/local/httpclient.dart';

final si = GetIt.instance;

Future<void> initInstance() async {
  const doiTimeOut = 30; //30 seconds
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: doiTimeOut),
    receiveTimeout: const Duration(seconds: doiTimeOut),
    sendTimeout: const Duration(seconds: doiTimeOut),
    receiveDataWhenStatusError: true,
    headers: {'accept': 'application/json', 'content-type': 'application/json'},
  ));

  si.registerLazySingleton<HttpClient>(() => HttpClientImp(dio: si()));

  si.registerLazySingleton<UserRemoteData>(
      () => UserRemoteDataImp(client: si()));

  si.registerLazySingleton<TransferRemoteData>(
      () => TrasnferRemoteDataImp(client: si()));

  si.registerLazySingleton(() => dio);
}
