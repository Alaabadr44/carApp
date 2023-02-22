

import '../../networking/constants.dart';

class ApiStatus<T> {
  T? data;
  String? message;
  Status? status;
  int? subStatusCode;

  ApiStatus({this.data, this.message, this.status, this.subStatusCode});

  ApiStatus.success(this.data) : status = const SuccessStatus();

  ApiStatus.unAuthorized(this.message) : status = const UnAuthorizedStatus();

  ApiStatus.noInternet({int subStatusCode = ApiConstants.defaultSubStatus})
      : status = NoInternetStatus(subStatusCode: subStatusCode);

  ApiStatus.error({
    int subStatusCode = ApiConstants.defaultSubStatus,
    String? message = "",
  }) : status = ErrorStatus(
          subStatusCode: subStatusCode,
          message: message,
        );
}

abstract class Status {
  final int? subStatusCode;
  final String? message;

  const Status(this.subStatusCode, [this.message]);
}

class NoInternetStatus extends Status {
  const NoInternetStatus({
    int subStatusCode = ApiConstants.defaultSubStatus,
  }) : super(subStatusCode);
}

class SuccessStatus extends Status {
  const SuccessStatus({
    int subStatusCode = ApiConstants.defaultSubStatus,
  }) : super(subStatusCode);
}

class ErrorStatus extends Status {
  const ErrorStatus({
    int subStatusCode = ApiConstants.defaultSubStatus,
    String? message = "",
  }) : super(subStatusCode, message);
}

class UnAuthorizedStatus extends Status {
  const UnAuthorizedStatus({
    int subStatusCode = ApiConstants.defaultSubStatus,
  }) : super(subStatusCode);
}
