import 'package:flutter/material.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/group_standings/group_standings.dart';

import '../../../../../view_model/match_detail_view_model.dart';
import '../../../../global_widgets/app_loading.dart';
import '../widgets/ranking_widgets/league_table_item.dart';

class RankingTab extends StatelessWidget {
  const RankingTab({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    if (logic.isLoading) {
      return const AppLoading(isCenter: true);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          if (logic.standings != null) ...[
            const LeagueTableItem(),
          ],
          if (logic.groupStandings.isNotEmpty) ...[
            const GroupStandings(),
          ],
        ],
      ),
    );
  }
}
