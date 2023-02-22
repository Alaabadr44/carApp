class UiState<T> {
  T? data;
  String? message;
  ApiState? state;

  UiState({this.data, this.message, this.state});

  UiState.loading({
    LoadingType loadingType = LoadingType.main,
  }) : state = Loading(loadingType: loadingType);

  UiState.success(this.data) : state = const Success();

  UiState.noData(this.data) : state = const NoData(404);

  UiState.noInternet() : state = const NoInternet();

  UiState.error(this.message, int? statusCode)
      : state = Error(
          message: message,
          statusCode: statusCode,
        );

  UiState.unAuthorized(this.message)
      : state = const Error(
          statusCode: 401,
          message: "UnAuthorized",
        );

  UiState.serverError(this.message) : state = const ServerError();

  UiState.idle() : state = const Idle();
}

abstract class ApiState {
  final int? statusCode;
  final String? message;
  const ApiState({
    this.statusCode,
    this.message,
  });
}

class Success extends ApiState {
  const Success() : super(statusCode: 200);
}

class NoData extends ApiState {
  const NoData(int statusCode) : super(statusCode: statusCode);
}

class Loading extends ApiState {
  final LoadingType loadingType;

  const Loading({this.loadingType = LoadingType.main});
}

class NoInternet extends ApiState {
  const NoInternet();
}

class Error extends ApiState {
  const Error({
    int? statusCode,
    String? message,
  }) : super(statusCode: statusCode, message: message);
}

class ServerError extends ApiState {
  const ServerError() : super(statusCode: 500);
}

class Idle extends ApiState {
  const Idle();
}

enum LoadingType { main, refresh, paging }

extension UiStateExtension on UiState {
  bool get isLoading => state.runtimeType == Loading;

  bool get isLoadingMore =>
      state.runtimeType == Loading &&
      (state as Loading).loadingType == LoadingType.paging;

  bool get isError => state.runtimeType == Error;

  bool get isNoInternet => state.runtimeType == NoInternet;

  bool get isNoData => state.runtimeType == NoData;

  bool get isServerError => state.runtimeType == ServerError;

  bool get isSuccess => state.runtimeType == Success;

  bool get isIdle => state.runtimeType == Idle;

  T? getDataWrapper<T>() {
    if (isSuccess) {
      return (data as T);
    } else {
      return null;
    }
  }
}
