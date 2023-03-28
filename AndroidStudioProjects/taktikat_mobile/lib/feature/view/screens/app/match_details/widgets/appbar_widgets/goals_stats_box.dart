import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';

class GoalsStatsBox extends StatelessWidget {
  const GoalsStatsBox({
    super.key,
    required this.name,
    required this.minutes,
  });

  final String name;
  final List<int> minutes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: FontSize.fontSize10,
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 3),
        Wrap(
          children: List.generate(
            minutes.length,
            (index) => Text(
              index == minutes.length - 1
                  ? minutes[index].toString()
                  : '${minutes[index]},',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: FontSize.fontSize10,
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
