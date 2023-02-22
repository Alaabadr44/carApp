import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../networking/networking_app_service.dart';
import '../../base/APIStatus.dart';
import '../../base/BaseResponse.dart';

abstract class BaseRepository {
  final networkService = Get.find<NetworkingAppService>();
  ApiStatus<T> parseResponseToStatus<T extends BaseResponse>(
    Response<dynamic> response,
    T Function() creator,
  ) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        {
          return ApiStatus.success(creator());
        }

      case HttpStatus.unprocessableEntity:
        return ApiStatus.error(
            message: response.data['message'],
            subStatusCode: HttpStatus.unprocessableEntity);
      case HttpStatus.notFound:
        return ApiStatus.error(
            message: 'Api Not Found', subStatusCode: HttpStatus.notFound);
      case HttpStatus.badRequest:
        return ApiStatus.error(
          subStatusCode: HttpStatus.badRequest,
          message: "Bad Request",
        );
      case HttpStatus.unauthorized:
        return ApiStatus.unAuthorized("UnAuthorized");
      case HttpStatus.forbidden:
        return ApiStatus.unAuthorized("UnAuthorized");
      case HttpStatus.internalServerError:
        return ApiStatus.error(subStatusCode: HttpStatus.internalServerError);
      default:
        return ApiStatus.error(subStatusCode: HttpStatus.internalServerError);
    }
  }
}
