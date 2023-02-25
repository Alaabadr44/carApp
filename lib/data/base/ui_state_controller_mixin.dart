import 'package:get/get.dart';

import 'APIStatus.dart';
import 'ui_state.dart';

mixin UiStateControllerMixin on GetxController {
  UiState<T> mapToUiState<T>(ApiStatus responseStatus) {
    switch (responseStatus.status.runtimeType) {
      case NoInternetStatus:
        return UiState.noInternet();
      case SuccessStatus:

      
        return UiState.success(responseStatus.data);
      case ErrorStatus:
        return UiState.error(
          responseStatus.status?.message,
          responseStatus.status?.subStatusCode,
        );
      case UnAuthorizedStatus:
        return UiState.unAuthorized(responseStatus.message);
      default:
        return UiState.error("Generic Error", 0);
    }
  }
}
