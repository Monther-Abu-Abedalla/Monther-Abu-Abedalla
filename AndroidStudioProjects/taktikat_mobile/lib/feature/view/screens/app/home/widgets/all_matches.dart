import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../utils/constants/const_gifs.dart';
import '../../../../../../utils/shimmer/home_screen_skeleton.dart';
import '../../../../../../utils/utils/utils.dart';
import 'league_matches_item.dart';

class AllMatches extends StatelessWidget {
  const AllMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(
      builder: (logic) {
        if (logic.isLoading) {
          return const HomeScreenSkeleton();
        }
        if (logic.matches.isEmpty) {
          return Center(
            child: Text(
              StringKeys.singleton.noMatches.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorManager.instance.secondary,
                  ),
            ),
          );
        }
        return LazyLoadScrollView(
          onEndOfPage: () => logic.loadMoreMatches(),
          isLoading: logic.paginationLoading,
          scrollOffset: 150,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            physics: Utils.instance.getAppScrollPhysics(),
            children: [
              LeagueMatchesItem(matches: logic.matches),
              const SizedBox(height: 10),
              if (logic.paginationLoading) ...[
                Center(
                  child: Image.asset(
                    ConstGifs.loadingPagination,
                    height: 30,
                    fit: BoxFit.contain,
                    width: 30,
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
