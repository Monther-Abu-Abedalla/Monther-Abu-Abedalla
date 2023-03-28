import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/who_will_win_item.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';


import '../../../../global_widgets/app_loading.dart';

class WhoWillWinList extends StatelessWidget {
  const WhoWillWinList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(
      builder: (logic) {
        if (logic.isLoading) {
          return const AppLoading(isCenter: true);
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: WhoWillWimItem(
            competitions: logic.competition,
          ),
        );
      },
    );
  }
}
