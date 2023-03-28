import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/utils/utils/utils.dart';

class UserPreferencesMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
   final HomeViewModel homeViewModel = Utils.instance.getController(HomeViewModel());
    homeViewModel.getUserPreferences();
    homeViewModel.getThemes();
    return super.onPageCalled(page);
  }
}
