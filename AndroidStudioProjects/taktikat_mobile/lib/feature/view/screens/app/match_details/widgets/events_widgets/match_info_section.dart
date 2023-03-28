import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../view_model/match_detail_view_model.dart';
import 'match_info_label.dart';

class MatchInfoSection extends StatelessWidget {
  const MatchInfoSection({Key? key, required this.logic}) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppSize.r8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: ColorManager.instance.hintColor,
            borderRadius: BorderRadius.circular(AppSize.r8),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSize.r8),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Text(
                  StringKeys.singleton.matchInfo.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.instance.dashColor,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MatchInfoLabel(
                      label: StringKeys.singleton.stadium.tr,
                      svgPath: ConstSvg.staduim,
                    ),
                    if (logic.matchDetails?.referee != null) ...[
                      MatchInfoLabel(
                        label: StringKeys.singleton.referee.tr,
                        svgPath: ConstSvg.refaree,
                      )
                    ],
                    MatchInfoLabel(
                      label: StringKeys.singleton.attendance.tr,
                      svgPath: ConstSvg.attendance,
                    ),
                    MatchInfoLabel(
                      label: StringKeys.singleton.date.tr,
                      svgPath: ConstSvg.calender,
                    ),
                  ],
                ),
                const VerticalDivider(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MatchInfoLabel(
                        label: Utils.instance.isArabic()
                            ? logic.matchDetails?.stadium?.titleValue?.ar ?? ''
                            : logic.matchDetails?.stadium?.titleValue?.en ?? '',
                        haveSvg: false,
                        isTextExpaded: true,
                      ),
                      if (logic.matchDetails?.referee != null) ...[
                        MatchInfoLabel(
                          label: logic.matchDetails?.referee?.name ?? '',
                          haveSvg: false,
                          isTextExpaded: true,
                        ),
                      ],
                      MatchInfoLabel(
                        label: logic.matchDetails?.stadium?.numberOfSeats
                                .toString() ??
                            StringKeys.singleton.unknown.tr,
                        svgPath: ConstSvg.staduim,
                        haveSvg: false,
                        isTextExpaded: true,
                      ),
                      MatchInfoLabel(
                        label: logic.matchDetails?.date ?? '',
                        svgPath: ConstSvg.staduim,
                        haveSvg: false,
                        isTextExpaded: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
