import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/utils/date/date_time_util.dart';

import '../../../../../../../utils/utils/utils.dart';
import '../../../../../../model/models/match/match_model.dart';
import '../../../../../global_widgets/my_network_image.dart';

class ConfrontationItem extends StatelessWidget {
  const ConfrontationItem(
      {super.key,
      required this.match,
      required this.homeTeamID,
      required this.isMatchComing});

  final Matches? match;
  final int? homeTeamID;
  final bool isMatchComing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.instance.transparent,
      borderRadius: BorderRadius.circular(AppSize.r8),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSize.r8),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              const SizedBox(width: 10),
              MyNetworkImage(
                url: match?.league?.logo,
                width: AppSize.w30,
                height: AppSize.h30,
              ),
              const SizedBox(width: 10),
              if (isMatchComing) ...[
                Expanded(
                  child: Column(
                    children: [
                      MyNetworkImage(
                        url: match?.homeTeamId == homeTeamID
                            ? match?.homeTeam?.logo ?? ''
                            : match?.awayTeam?.logo ?? '',
                        width: AppSize.w30,
                        height: AppSize.h30,
                      ),
                      Text(
                        match?.homeTeam?.id == homeTeamID
                            ? Utils.instance.isArabic()
                                ? match?.homeTeam?.nameValues?.ar ?? ''
                                : match?.homeTeam?.nameValues?.en ?? ''
                            : Utils.instance.isArabic()
                                ? match?.awayTeam?.nameValues?.ar ?? ''
                                : match?.awayTeam?.nameValues?.en ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ] else ...[
                Expanded(
                  child: Text(
                    match?.homeTeamId == homeTeamID
                        ? match?.homeScore.toString() ?? ''
                        : match?.awayScore.toString() ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.possessionBlue,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Utils.instance.isArabic()
                          ? match?.league?.nameValues?.ar ?? ''
                          : match?.league?.nameValues?.en ?? '',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: FontSize.fontSize10,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateUtility.getDateinNumbersFormat(date: match?.startAt),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: FontSize.fontSize12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ],
                ),
              ),
              if (isMatchComing) ...[
                Expanded(
                  child: Column(
                    children: [
                      MyNetworkImage(
                        url: match?.awayTeamId == homeTeamID
                            ? match?.homeTeam?.logo ?? ''
                            : match?.awayTeam?.logo ?? '',
                        width: AppSize.w30,
                        height: AppSize.h30,
                      ),
                      Text(
                        match?.awayTeamId == homeTeamID
                            ? Utils.instance.isArabic()
                                ? match?.homeTeam?.nameValues?.ar ?? ''
                                : match?.homeTeam?.nameValues?.en ?? ''
                            : Utils.instance.isArabic()
                                ? match?.awayTeam?.nameValues?.ar ?? ''
                                : match?.awayTeam?.nameValues?.en ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ] else ...[
                Expanded(
                  child: Text(
                    match?.awayTeamId == homeTeamID
                        ? match?.homeScore.toString() ?? ''
                        : match?.awayScore.toString() ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.possessionRed,
                        ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
