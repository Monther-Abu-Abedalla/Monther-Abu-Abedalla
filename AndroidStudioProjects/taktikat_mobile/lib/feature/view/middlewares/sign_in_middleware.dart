import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/auth_view_model.dart';
import 'package:taktikat/utils/utils/utils.dart';

class SignInMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    Utils.instance.getController(AuthViewModel()).cleanLoginForm();
    return super.onPageCalled(page);
  }
}
