import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/view/middlewares/profile_middelware.dart';
import 'package:taktikat/feature/view/middlewares/sign_in_middleware.dart';
import 'package:taktikat/feature/view/screens/app/match_details/match_details_screen.dart';
import 'package:taktikat/feature/view/screens/app/profile/profile_screen.dart';
import 'package:taktikat/feature/view/screens/app/user_pereferances/Widgets/user_theme.dart';
import 'package:taktikat/feature/view/screens/app/user_pereferances/user_preferences_screen.dart';
import 'package:taktikat/feature/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:taktikat/utils/router/routes.dart';

import '../../feature/view/middlewares/home_place_holder_middleware.dart';
import '../../feature/view/middlewares/match_details_middleware.dart';
import '../../feature/view/middlewares/user_preferences_middleware.dart';
import '../../feature/view/middlewares/verification_code_middleware.dart';
import '../../feature/view/screens/app/home/home_place_holder.dart';
import '../../feature/view/screens/auth/verification_code/verification_code_screen.dart';

class Router {
  static final Router router = Router._internal();
  Router._internal();

  final List<GetPage> routes = [
    GetPage(
      name: Routes.homePlaceHolder,
      page: () => const HomePlaceHolder(),
      middlewares: [HomePlaceHolderMiddleware()],
    ),
    GetPage(
        name: Routes.signUp,
        page: () => const SignUpScreen(),
        middlewares: [SignInMiddleware()]),
    GetPage(
      name: Routes.verificationCode,
      page: () => VerificationCodeScreen(
        isUpdate: Get.arguments ?? false,
      ),
      middlewares: [VerificationCodeMiddleware()],
    ),
    GetPage(
      name: Routes.userPreferences,
      page: () {
        final bool isFromProfile = Get.arguments ?? false;
        return UserPreferencesScreen(
          isFromProfile: isFromProfile,
        );
      },
      middlewares: [UserPreferencesMiddleware()],
    ),
    GetPage(
      name: Routes.matchDetails,
      page: () {
        final int matchId = Get.arguments ?? 0;
        Logger().i(matchId);
        return MatchDetailsScreen(matchId: matchId);
      },
      middlewares: [
        MatchDetailsMiddleware(),
      ],
      arguments: Get.arguments,
    ),
    GetPage(
      name: Routes.userProfile,
      page: () => const ProfileScreen(),
      middlewares: [ProfileMiddelware()],
    ),
    GetPage(
      name: Routes.userTheme,
      page: () {
        final bool isFromDrawer = Get.arguments ?? false;
        return UserTheme(isFromDrawer: isFromDrawer);
      },
    )
  ];
}
