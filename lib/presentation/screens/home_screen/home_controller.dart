import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../data/base/ui_state.dart';
import '../../../data/base/ui_state_controller_mixin.dart';
import '../../../data/repositories/home/home_repository.dart';
import '../../../data/response/home/home_res_model.dart';
import '../../base/main_controller.dart';

class HomeController extends MainController with UiStateControllerMixin {
  final homeState = Rxn<UiState<HomeResModel>>();
  final HomeRepository homeRepository;
  HomeController(this.homeRepository);
  _loadHome() async {
    homeState.value = UiState.loading();
    final res = await homeRepository.getHome();
    final state = mapToUiState<HomeResModel>(res);
    if (state.isSuccess) {
      print(" res ${res.data!.data.banar.toString()} ");
    }
    homeState.value = state;
  }

  @override
  void onInit() {
    _loadHome();
    super.onInit();
  }








}
