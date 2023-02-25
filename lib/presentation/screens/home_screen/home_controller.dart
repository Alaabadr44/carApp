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
    final res = await homeRepository.getHome();
    homeState.value = mapToUiState<HomeResModel>(res);
  }

  @override
  void onInit() {
    _loadHome();
    super.onInit();
  }







  
}
