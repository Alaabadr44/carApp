import '../../../networking/networking_app_service.dart';
import '../../base/APIStatus.dart';
import '../../response/home/home_res_model.dart';
import '../base/BaseRepository.dart';

class HomeRepository extends BaseRepository {
  final NetworkingAppService networkingService;
  HomeRepository(
    this.networkingService,
  );

  Future<ApiStatus<HomeResModel>> getHome() async {
   await Future.delayed(Duration(seconds: 3));
    final response = await networkingService.getHome();
    return parseResponseToStatus<HomeResModel>(
      response,
      () => HomeResModel.fromJson(response.data),
    );
  }
}
