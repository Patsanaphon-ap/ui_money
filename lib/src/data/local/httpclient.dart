import 'package:dio/dio.dart';

enum MethodApiType { get, post, put, delete }

class ResponseResult {
  final int code;
  final bool status;
  final String message;
  final dynamic data;

  ResponseResult(
      {this.code = 404, this.status = false, this.message = '', this.data});
}

abstract class HttpClient {
  Future<ResponseResult> get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ResponseResult> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ResponseResult> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ResponseResult> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });
}

class HttpClientImp implements HttpClient {
  final Dio dio;

  HttpClientImp({required this.dio});

  Future<ResponseResult> _createApi(
    MethodApiType method,
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    bool myTag = true,
  }) async {
    try {
      Response<dynamic>? response;

      print('========== Request API ==========');
      print(url);
      print('=================================');

      if (method == MethodApiType.get) {
        response = await dio.get(url,
            queryParameters: query, options: options, cancelToken: cancelToken);
      } else if (method == MethodApiType.post) {
        response = await dio.post(url,
            data: data,
            queryParameters: query,
            options: options,
            cancelToken: cancelToken);
      } else if (method == MethodApiType.put) {
        response = await dio.put(url,
            data: data,
            queryParameters: query,
            options: options,
            cancelToken: cancelToken);
      } else if (method == MethodApiType.delete) {
        response = await dio.delete(url,
            data: data,
            queryParameters: query,
            options: options,
            cancelToken: cancelToken);
      }
      if (response == null) {
        return ResponseResult(
            code: 500, message: 'Error on request from server');
      } else if (response.data == "") {
        return ResponseResult(
            code: response.statusCode ?? 204,
            message: 'Error on request from server');
      }

      final code = response.statusCode ?? 404;
      final status = (code == 200) || (code == 201 || (code == 204));
      dynamic datas;
      String message = '';

      datas = response.data['data'] ?? '';
      message = response.data['message'] as String? ?? '';

      if (status) {
        return ResponseResult(
            code: code, status: status, data: datas, message: message);
      } else {
        return ResponseResult(code: code, message: 'ERROR ELSE');
      }
    } on DioException catch (e) {
      int code = 404;
      String message = '';
      if (e is DioExceptionType) {
        if (url.contains('token')) {
          code = e.response!.statusCode ?? 404;
          if (e.response!.data is Map) {
            message = e.response!.data['data']['description'] ??
                e.response!.data['message'] ??
                '${e.error}';
          } else {
            message = '${e.error}';
            // message = '${e.response!.data ?? e.error}';
          }
        } else {
          code = e.response!.statusCode!;
          message = '${e.error}';
          if (e.response!.data is Map) {
            message = e.response!.data['message'] ??
                e.response!.data['errorMessage'] ??
                '${e.error}';
            // message = e.response!.data['message'] ?? e.error.toString();
          } else {
            message = '${e.error}';
            // message = '${e.response!.data ?? e.error}'; //e.response!.data.toString();
          }
        }
      } else if (e.type == DioExceptionType.badResponse) {
        code = 400;
        message = 'error';
        return ResponseResult(
            code: code, message: message, data: e.response?.data ?? '');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        code = 408;
        message = 'Time Out';
      } else if (e.type == DioExceptionType.cancel) {
        if (CancelToken.isCancel(e)) {
          code = 444;
          message = 'Cancelled';
          cancelToken = CancelToken();
        }
      } else {
        //other
        message = 'Server Error';
      }
      return ResponseResult(code: code, message: message);
    }
  }

  @override
  Future<ResponseResult> get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return await _createApi(
      MethodApiType.get,
      url,
      query: query,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );
  }

  @override
  Future<ResponseResult> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return await _createApi(
      MethodApiType.post,
      url,
      data: data,
      query: query,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );
  }

  @override
  Future<ResponseResult> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return await _createApi(
      MethodApiType.put,
      url,
      data: data,
      query: query,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );
  }

  @override
  Future<ResponseResult> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return await _createApi(
      MethodApiType.delete,
      url,
      data: data,
      query: query,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );
  }
}
