import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../../utils/utils/utils.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../model/models/match_details/group_standings/standings_model.dart';
import '../../../../../../view_model/match_detail_view_model.dart';
import '../../../../../global_widgets/my_network_image.dart';
import '../ranking_widgets/table_label.dart';

class GroupStandings extends StatelessWidget {
  const GroupStandings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailViewModel>(
      builder: (logic) {
        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          separatorBuilder: (context, index) => const SizedBox(height: 32),
          itemCount: logic.groupStandings.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(AppSize.r8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Align(
                            alignment: Utils.instance.isArabic()
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: MyNetworkImage(
                              url: Utils.instance
                                  .getController(MatchDetailViewModel())
                                  .matchDetails
                                  ?.league
                                  ?.logo,
                              height: AppSize.h40,
                              width: AppSize.w40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              logic.groupStandings[index].round?.name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.instance.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TableLabel(
                        label: StringKeys.singleton.play.tr,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TableLabel(
                        label: StringKeys.singleton.win.tr,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TableLabel(
                        label: StringKeys.singleton.draw.tr,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TableLabel(
                        label: StringKeys.singleton.lose.tr,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TableLabel(
                        label: StringKeys.singleton.goals.tr,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TableLabel(
                        label: StringKeys.singleton.tp.tr,
                      ),
                    ),
                    const SizedBox(width: 2),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const {
                    0: FlexColumnWidth(6),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                    5: FlexColumnWidth(1),
                    6: FlexColumnWidth(1),
                  },
                  children: [
                    for (final standing
                        in logic.groupStandings[index].standingRow)
                      ...buildTableRow(
                        standing: standing,
                        context: context,
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<TableRow> buildTableRow({
    required StandingRow standing,
    required BuildContext context,
  }) {
    return [
      TableRow(
        children: [
          Material(
            color: ColorManager.instance.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSize.r8),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  children: [
                    Text(standing.rank.toString()),
                    const SizedBox(width: 10),
                    MyNetworkImage(
                      url: standing.team?.logo,
                      height: AppSize.h20,
                      width: AppSize.w20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        standing.team?.name ?? '',
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            standing.all?.played.toString() ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            standing.all?.win.toString() ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            standing.all?.draw.toString() ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            standing.all?.lose.toString() ?? '',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
          Text(
            standing.goalsDiff?.toString() ?? '',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
          Text(
            standing.points.toString(),
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      const TableRow(
        children: [
          Divider(),
          Divider(),
          Divider(),
          Divider(),
          Divider(),
          Divider(),
          Divider(),
        ],
      ),
    ];
  }
}
