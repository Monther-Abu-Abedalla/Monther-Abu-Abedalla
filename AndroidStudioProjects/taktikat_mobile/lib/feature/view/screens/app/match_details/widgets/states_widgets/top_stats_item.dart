import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';

import '../../../../../../core/theme/color/color_manager.dart';

class TopStatsItem extends StatelessWidget {
  const TopStatsItem({
    super.key,
    required this.homeTeamStats,
    required this.awayTeamStats,
    required this.statsName,
  });

  final String homeTeamStats;
  final String awayTeamStats;
  final String statsName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
            decoration: BoxDecoration(
              color: ColorManager.instance.statsBackgroundColor,
              borderRadius: BorderRadius.circular(AppSize.r6),
            ),
            child: Text(
              homeTeamStats,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: FontSize.fontSize10,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          flex: 2,
          child: Text(
            statsName,
            maxLines: 3,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.instance.dashColor,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
            decoration: BoxDecoration(
              color: ColorManager.instance.statsBackgroundColor,
              borderRadius: BorderRadius.circular(AppSize.r6),
            ),
            child: Text(
              awayTeamStats,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
