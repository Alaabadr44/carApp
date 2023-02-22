import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../localization/change_language.dart';

class OurInterceptor extends InterceptorsWrapper {
  final loggingTag = "DIO_TAG ::: ";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final slug = cacheStorage.read<String?>(CacheStorageKeys.slug);
    final locale = TLang.getCurrentLocale().name
     ;
    options.headers['Accept'] = "application/json";
    // if (slug != null) {
    //   options.headers['slug'] = slug;
    // }
    // it must be edit from app locale
    options.headers['locale'] = locale;

    // if (cacheStorage.hasData(CacheStorageKeys.loginResponse)) {
    //   options.headers["Authorization"] =
    //       "Bearer ${LoginResponse.wrapData(cacheStorage.read(CacheStorageKeys.loginResponse)).accessToken!}";
    // }

    if (kDebugMode) {
      print(
        '$loggingTag-REQUEST[${options.method}] => PATH: ${options.path}',
      );
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '$loggingTag-RESPONSE[${response.data}] => EXTRAS: ${response.extra}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '$loggingTag-ERROR[${err.error}] => MESSAGE: ${err.message}|| StackTrace: ${err.stackTrace}',
      );
    }
    if (err.response == null) {
      handler.resolve(
        Response(
          requestOptions: err.requestOptions,
          data: <String, dynamic>{},
        ),
      );
    } else {
      handler.resolve(err.response!);
    }
  }
}
