import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;

import 'constants.dart';
import 'dio_client.dart';
import 'mockup_utility.dart';

class NetworkingAppService extends get_x.GetxService {
  NetworkingAppService();

  Future<Response<dynamic>> getHome() async {
    MockupUtils.mockGetRequest(
      mockResponsePath: MockUpsPath.home,
      requestEndPoint: ApiConstants.home,
      requestData: {},
    );
    return DioClient.instance.get(ApiConstants.home);
  }
}
