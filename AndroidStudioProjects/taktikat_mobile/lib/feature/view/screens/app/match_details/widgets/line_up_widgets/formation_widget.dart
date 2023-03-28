import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/model/enums/lineup_types.dart';
import 'package:taktikat/feature/model/models/match_details/lineup/home_lineup.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/line_up_widgets/player_in_formation.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/constants/const_images.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../global_widgets/custom_dialog.dart';
import '../lineup_swither.dart';

class Lineup extends StatelessWidget {
  final List<HomeLineup> lineup;
  final String plan;
  final String? homeTeamLogo;
  final String? awayTeamLogo;
  final String? homeFormation;
  final String? awayFormation;
  final bool isHomeTeam;

  const Lineup({
    Key? key,
    required this.lineup,
    required this.plan,
    this.homeTeamLogo,
    this.awayTeamLogo,
    this.homeFormation,
    this.awayFormation,
    required this.isHomeTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List formation = plan.split('-');
    formation = formation.map((e) => int.tryParse(e) ?? 0).toList();
    final List<Widget> rows = [];

    rows.add(
      PlayerInFormation(
        onTap: () {
          Utils.instance
              .getController(MatchDetailViewModel())
              .setActivePlayerDetails(
                lineup.firstWhereOrNull(
                    (element) => element.lineup?.grid == '1:1'),
              );
          CustomDialog.instance.playerDialog(
            isHome: isHomeTeam,
            teamLogo: isHomeTeam ? homeTeamLogo : awayTeamLogo,
            context: context,
          );
        },
        name: lineup
                .firstWhereOrNull((element) => element.lineup?.grid == '1:1')
                ?.player
                ?.name ??
            '',
        image: lineup
                .firstWhereOrNull((element) => element.lineup?.grid == '1:1')
                ?.player
                ?.image ??
            '',
        myIndexInRow: -1,
        totalRowsIndex: -1,
        rating:
            '${lineup.firstWhereOrNull((element) => element.lineup?.grid == '1:1')?.playerMatchStatistics?.rating ?? ''}',
      ),
    );

    for (int outerElement = 0;
        outerElement < formation.length;
        outerElement++) {
      rows.add(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              for (int i = 0; i < formation[outerElement]; i++)
                Expanded(
                  child: PlayerInFormation(
                    onTap: () {
                      Utils.instance
                          .getController(MatchDetailViewModel())
                          .setActivePlayerDetails(
                            lineup.firstWhereOrNull((element) =>
                                element.lineup?.grid ==
                                '${outerElement + 2}:${i + 1}'),
                          );
                      CustomDialog.instance.playerDialog(
                        isHome: isHomeTeam,
                        teamLogo: isHomeTeam ? homeTeamLogo : awayTeamLogo,
                        context: context,
                      );
                    },
                    name: lineup
                            .firstWhereOrNull((element) =>
                                element.lineup?.grid ==
                                '${outerElement + 2}:${i + 1}')
                            ?.player
                            ?.name ??
                        '',
                    image: lineup
                            .firstWhereOrNull((element) =>
                                element.lineup?.grid ==
                                '${outerElement + 2}:${i + 1}')
                            ?.player
                            ?.image ??
                        '',
                    rating:
                        '${lineup.firstWhereOrNull((element) => element.lineup?.grid == '${outerElement + 2}:${i + 1}')?.playerMatchStatistics?.rating ?? ''}',
                    myIndexInRow: i,
                    totalRowsIndex: formation[outerElement],
                    numberOfGoals: lineup
                            .firstWhereOrNull((element) =>
                                element.lineup?.grid ==
                                '${outerElement + 2}:${i + 1}')
                            ?.playerMatchStatistics
                            ?.goals ??
                        0,
                    numberOfYellowCards: lineup
                            .firstWhereOrNull((element) =>
                                element.lineup?.grid ==
                                '${outerElement + 2}:${i + 1}')
                            ?.extraData
                            ?.cards
                            ?.yellow ??
                        0,
                    numberOfRedCards: lineup
                            .firstWhereOrNull((element) =>
                                element.lineup?.grid ==
                                '${outerElement + 2}:${i + 1}')
                            ?.extraData
                            ?.cards
                            ?.red ??
                        0,
                  ),
                )
            ],
          ),
        ),
      );

      rows.add(const SizedBox(height: 20));
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ConstImages.lineup,
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: GetBuilder<MatchDetailViewModel>(
        builder: (matchLogic) {
          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.only(top: 50),
                shrinkWrap: true,
                primary: false,
                children: rows.reversed.toList(),
              ),
              Positioned(
                top: 20,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    LineupSwitcher(
                      formation: homeFormation,
                      teamImage: homeTeamLogo,
                      isSelected:
                          matchLogic.selectedTeamLineup == LineupTypes.home,
                      onChanged: (value) {
                        matchLogic.changeSelectedTeamLineup(LineupTypes.home);
                      },
                    ),
                    const Spacer(),
                    Text(
                      StringKeys.singleton.lineup.tr,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    LineupSwitcher(
                      formation: awayFormation,
                      teamImage: awayTeamLogo,
                      isSelected:
                          matchLogic.selectedTeamLineup == LineupTypes.away,
                      onChanged: (value) {
                        matchLogic.changeSelectedTeamLineup(LineupTypes.away);
                      },
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
