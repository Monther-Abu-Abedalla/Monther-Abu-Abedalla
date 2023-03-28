import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';

import '../../../../../../core/theme/color/color_manager.dart';

class StatsItem extends StatelessWidget {
  const StatsItem({
    Key? key,
    required this.title,
    required this.awayScore,
    required this.homeScore,
    this.spacingRation,
    this.hasDivider = true,
    required this.homePercentage,
    required this.awayPercentage,
  }) : super(key: key);

  final String title;
  final int awayScore;
  final int homeScore;
  final double? spacingRation;
  final bool hasDivider;
  final num homePercentage;
  final num awayPercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            Text(
              homeScore.toString(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: FontSize.fontSize12,
                  ),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorManager.instance.dashColor,
                    fontSize: FontSize.fontSize14,
                  ),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              awayScore.toString(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: FontSize.fontSize12,
                  ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: ColorManager.instance.darkGrey,
                  borderRadius: BorderRadius.circular(AppSize.w4),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: homePercentage.toInt(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.instance.possessionBlue,
                          borderRadius: BorderRadius.circular(AppSize.w4),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: awayPercentage.toInt(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.instance.possessionRed,
                          borderRadius: BorderRadius.circular(AppSize.r4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ],
    );
  }
}
