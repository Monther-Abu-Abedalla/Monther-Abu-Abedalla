import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../view_model/match_detail_view_model.dart';
import '../../../../../global_widgets/my_network_image.dart';

class ConfrontationAwayTeam extends StatelessWidget {
  const ConfrontationAwayTeam({Key? key, required this.logic})
      : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        StringKeys.singleton.wins.tr,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ColorManager.instance.possessionRed,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        logic.matchConfrontations?.statistics?.awayWins
                                .toString() ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ColorManager.instance.possessionRed,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Material(
                      color: ColorManager.instance.transparent,
                      child: InkWell(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.r8)),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              MyNetworkImage(
                                url:
                                    logic.matchConfrontations?.awayTeam?.logo ??
                                        '',
                                width: AppSize.w30,
                                height: AppSize.h30,
                              ),
                              Expanded(
                                child: Text(
                                  Utils.instance.isArabic()
                                      ? logic.matchConfrontations?.awayTeam
                                              ?.nameValues?.ar ??
                                          ''
                                      : logic.matchConfrontations?.awayTeam
                                              ?.nameValues?.en ??
                                          '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
