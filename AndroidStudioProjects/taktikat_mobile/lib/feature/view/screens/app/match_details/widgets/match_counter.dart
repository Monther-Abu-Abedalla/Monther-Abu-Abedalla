import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

class MatchCounter extends StatelessWidget {
  const MatchCounter({
    super.key,
    required this.matchDate,
  });

  final DateTime matchDate;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: matchDate.difference(DateTime.now()) > Duration.zero
          ? matchDate.difference(DateTime.now())
          : Duration.zero,
      tween: Tween<double>(
          begin: matchDate.difference(DateTime.now()).inSeconds.toDouble() > 0
              ? matchDate.difference(DateTime.now()).inSeconds.toDouble()
              : 0,
          end: 0),
      onEnd: () {},
      builder: (BuildContext context, double value, Widget? child) {
        final int hours = value ~/ 3600;
        final int minutes = (value - hours * 3600) ~/ 60;
        final int seconds = value.toInt() - hours * 3600 - minutes * 60;

        final String hoursStr = hours.toString().padLeft(2, '0');
        final String minutesStr = minutes.toString().padLeft(2, '0');
        final String secondsStr = seconds.toString().padLeft(2, '0');

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Text(
              StringKeys.singleton.matchStartIn.tr,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 4),
            Text(
              '$hoursStr:$minutesStr:$secondsStr',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        );
      },
    );
  }
}
