import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/all_matches.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/favorite_widgets/favorite_matches.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/who_will_win_list.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';

import '../../../../model/enums/home_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(
      builder: (logic) {
        if (logic.getHomeActiveTab() == HomeTabs.allMatch) {
          return const AllMatches();
        } else if (logic.getHomeActiveTab() == HomeTabs.favorite) {
          return const FavoriteMatches();
        } else if (logic.getHomeActiveTab() == HomeTabs.whoWillWin) {
          return const WhoWillWinList();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
