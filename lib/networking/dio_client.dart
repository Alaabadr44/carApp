// import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

// import 'package:dio_http_cache/dio_http_cache.dart';

import 'constants.dart';
import 'our_interceptor.dart';

class DioClient {
  static Dio? dio;
  static DioAdapter? dioAdapter;
  static Dio get instance => getInstance();
  static Dio getInstance() {
    if (dio != null) return dio!;
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseDevUrl));
    dio?.interceptors.add(LogInterceptor());
    dio?.interceptors.add(OurInterceptor());
    // dio?.interceptors.add(ChuckerDioInterceptor());
    if (ApiConstants.enableMockUp) {
      dioAdapter = DioAdapter(dio: dio!);
      dio!.httpClientAdapter = dioAdapter!;
    }
    // dio?.interceptors.add(
    //   DioCacheManager(
    //     CacheConfig(
    //       baseUrl: ApiConstants.baseDevUrl,
    //     ),
    //   ).interceptor,
    // );
    return dio!;
  }
}
