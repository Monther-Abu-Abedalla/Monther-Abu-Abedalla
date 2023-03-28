import '../../feature/model/models/app/app_response.dart';
import '../../feature/model/models/home/theme_model.dart';

abstract class HomeRepo {
  Future<AppResponse> mainSearch({
    required String search,
    required Function Function(AppResponse response) onSuccess,
    required Function Function(AppResponse response) onError,
  });

  Future<AppResponse> updateUserTheme({ThemeModel? theme});



}
