import 'package:flutter/material.dart';

class WhoWillWinResult extends StatelessWidget {
  const WhoWillWinResult({
    super.key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamWinPercentage,
    required this.homeTeamColors,
    required this.awayTeamWinPercentage,
    required this.awayTeamColors,
    required this.drawPercentage,
  });

  final String homeTeamName;
  final String awayTeamName;
  final double homeTeamWinPercentage;
  final Color homeTeamColors;
  final double awayTeamWinPercentage;
  final Color awayTeamColors;
  final double drawPercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (homeTeamWinPercentage != 0) ...[
              Expanded(
                flex: homeTeamWinPercentage.round(),
                child: Column(
                  children: [
                    Text(
                      '${homeTeamWinPercentage.round()}% $homeTeamName',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: homeTeamColors,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      color: homeTeamColors,
                      value: homeTeamWinPercentage,
                    ),
                  ],
                ),
              )
            ],
            if (drawPercentage != 0) ...[
              Expanded(
                flex: drawPercentage.round(),
                child: Column(
                  children: [
                    Text(
                      '${drawPercentage.round()}% Draw',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      color: Theme.of(context).unselectedWidgetColor,
                      value: drawPercentage,
                    ),
                  ],
                ),
              )
            ],
            if (awayTeamWinPercentage != 0) ...[
              Expanded(
                flex: awayTeamWinPercentage.round(),
                child: Column(
                  children: [
                    Text(
                      '${awayTeamWinPercentage.round()}% $awayTeamName',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: awayTeamColors,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      color: awayTeamColors,
                      value: awayTeamWinPercentage,
                    ),
                  ],
                ),
              )
            ],
          ],
        ),
      ],
    );
  }
}
