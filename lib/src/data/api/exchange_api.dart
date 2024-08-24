import 'package:multiple_result/multiple_result.dart';
import 'package:ui_money/src/data/local/httpclient.dart';
import 'package:ui_money/src/data/model/country_rate_model.dart';
import 'package:ui_money/src/environment.dart';

abstract class ExchangeRemoteData {
  Future<Result<List<CountryRateModel>, String>> getCountryRate();
}

class ExchangeRemoteDataImp extends ExchangeRemoteData {
  final HttpClient client;
  ExchangeRemoteDataImp({required this.client});

  @override
  Future<Result<List<CountryRateModel>, String>> getCountryRate() async {
    ResponseResult resp = await client.get(
      '${Environment.apiUrl}/exchange/rate',
    );
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
