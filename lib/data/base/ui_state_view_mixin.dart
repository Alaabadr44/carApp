import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:one_context/one_context.dart';

import '../../configuration/navigation/AppRoutes.dart';
import '../../presentation/styled_component/LoadingView.dart';
import 'ui_state.dart';

mixin UiStateViewMixin {
  Widget handleUiState<T>(
    Rxn<UiState<T>> observableState,
    Widget Function(T model) success,
  ) {
    var stateValue = observableState.value;
    return _getWidgetOfUiState<T>(
      stateValue,
      success,
      loadingWidget,
      noInternetWidget,
      noDataWidget,
      errorWidget,
    );
  }

  Widget _getWidgetOfUiState<T>(
    UiState<T>? uiStateModel,
    Widget Function(T model) success,
    Widget Function(LoadingType loadingType) loading,
    Widget Function() noInternet,
    Widget Function() noData,
    Widget Function(ApiState? state) error,
  ) {
    if (uiStateModel == null) {
      return loadingWidget(LoadingType.main);
    } else {
      switch (uiStateModel.state.runtimeType) {
        case Loading:
          return _onLoading(uiStateModel, loading);
        case Success:
          return success(uiStateModel.data as T);
        case NoInternet:
          return noInternetWidget();
        case NoData:
          return noDataWidget();
        case Error:
          return errorWidget(uiStateModel.state);
        case ServerError:
          return errorWidget(const ServerError());

        case Idle:
        default:
          return const SizedBox.shrink();
      }
    }
  }

  Widget _onLoading(
    UiState stateValue,
    Widget Function(LoadingType loadingType) loading,
  ) {
    Loading loadingType = stateValue.state as Loading;
    return loading(loadingType.loadingType);
  }

  Widget loadingWidget(LoadingType loadingType) {
    if (loadingType == LoadingType.refresh) {
      return const SizedBox.shrink();
    } else if (loadingType == LoadingType.paging) {
      return const SizedBox.shrink();
    } else {
      return const LoadingView();
    }
  }

  // AwesomeDialog(
  // context: NotificationController.get,
  // dialogType: DialogType.INFO,
  // animType: AnimType.BOTTOMSLIDE,
  // title: 'Dialog Title',
  // desc: 'Dialog description here.............',
  // )
  Widget errorWidget(ApiState? state) {
    final unAuthorized = state?.statusCode == 401;
    OneContext.instance.showDialog(
      barrierDismissible: !unAuthorized,
      builder: (_) => AlertDialog(
        title: const Text("Error Massage"),
        content: Text(state?.message ?? "something went Wrong"),
        actions: [
          if (unAuthorized)
            TextButton(
              onPressed: () {
                Navigator.of(_).pop();
                // cacheStorage.remove(CacheStorageKeys.employeeData);
                // cacheStorage.remove(CacheStorageKeys.loginResponse);
                // cacheStorage.remove(CacheStorageKeys.slug);
                Get.offAndToNamed(Routes.Home);
              },
              child: Text('login'.tr),
            )
        ],
      ),
    );
    return const SizedBox.shrink();
  }

  Widget noInternetWidget() {
    return SizedBox(
        child: Center(
            child: Lottie.asset(
      'assets/json/lottiefiles/no-internet-connection-empty-state.json',
    )));
  }

  Widget noDataWidget() {
    return SizedBox(
        child: Center(
            child:
                Lottie.asset('assets/json/lottiefiles/empty_data_icon.json')));
  }
}
