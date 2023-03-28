import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../view_model/match_detail_view_model.dart';

class MatchDetailsMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: ColorManager.instance.white,
        statusBarColor: ColorManager.instance.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark));

    final MatchViewModel matchViewModel =
        Utils.instance.getController(MatchViewModel());
    final MatchDetailViewModel matchDetailViewModel =
        Utils.instance.getController(MatchDetailViewModel());
    matchViewModel.onInit();

    final Map<String, String> parameters = page?.parameters ?? {};

    matchDetailViewModel.initDrag();

    matchDetailViewModel.initController();

    matchDetailViewModel.getMatchCommentaries(
      matchId: int.tryParse(parameters['match'] ?? '0') ?? 0,
    );

    matchDetailViewModel.getMatchStandings(
      matchId: int.tryParse(parameters['match'] ?? '0') ?? 0,
    );
    matchDetailViewModel.getLineup(
        matchId: int.tryParse(parameters['match'] ?? '0') ?? 0);

    matchDetailViewModel.getMatchStandingsComparison(
      matchId: int.tryParse(parameters['match'] ?? '0') ?? 0,
    );
    matchDetailViewModel.getMatchConfrontations(
      matchId: int.tryParse(parameters['match'] ?? '0') ?? 0,
    );

    matchDetailViewModel.getMatchStatistics(
      matchId: int.tryParse(parameters['match'] ?? '0') ?? 0,
    );

    matchDetailViewModel.getTopRated(
      matchId: int.tryParse(parameters['match'] ?? '0') ?? 0,
    );

    return super.onPageCalled(page);
  }
}
