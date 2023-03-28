import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/profile_view_model.dart';
import 'package:taktikat/utils/utils/utils.dart';

class ProfileMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
   final ProfileViewModel profileViewModel =
        Utils.instance.getController(ProfileViewModel());
    profileViewModel.getProfile();
    profileViewModel.setUpUserForm();
    return super.onPageCalled(page);
  }
}
